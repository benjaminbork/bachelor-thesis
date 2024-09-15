import http from "k6/http";

function generateMatrix(n) {
  return Array.from({ length: n }, () =>
    Array.from({ length: n }, () => Math.random())
  );
}

const matrixA = generateMatrix(__ENV.PAYLOAD_SIZE);
const matrixB = generateMatrix(__ENV.PAYLOAD_SIZE);

const MAX_ITERATIONS_PER_VU = 100;

export const options = {
  scenarios: {
    example_scenario: {
      executor: "per-vu-iterations",
      vus: __ENV.VIRTUAL_USERS || 1,
      iterations: MAX_ITERATIONS_PER_VU,
      maxDuration: "60m",
    },
  },
};

const results = [];

function saveToDatabase(completeResults) {
  const records = completeResults.map((run) => {
    return {
      test_id: run?.testId ?? null,
      success: run?.success ?? false,
      cloud_provider: run?.cloudProvider ?? null,
      region: run?.region ?? null,
      run_time: run?.runTime ?? null,
      function_name: run?.functionName ?? null,
      allocated_memory: run?.allocatedMemory ?? null,
      cpu_cores: run?.cpuCores ?? null,
      execution_time: run?.executionTime ?? null,
      latency: run?.latency ?? null,
      was_cold_start: run?.isColdStart ?? false,
    };
  });

  const payload = JSON.stringify(records);

  const supabaseInsertUrl = `${__ENV.SUPABASE_URL}/rest/v1/${__ENV.SUPABASE_TABLE}`;

  const params = {
    headers: {
      "Content-Type": "application/json",
      apikey: __ENV.SUPABASE_API_KEY,
      Authorization: `Bearer ${__ENV.SUPABASE_API_KEY}`,
    },
  };

  const res = http.post(supabaseInsertUrl, payload, params);
  if (res.status !== 201) {
    console.error(`VU ${__VU} failed to save data to Supabase: ${res.body}`);
  } else {
    console.log(`VU ${__VU} successfully saved data to Supabase.`);
  }
}

export default async function () {
  const PAYLOAD = JSON.stringify({
    payload: {
      matrixA: matrixA,
      matrixB: matrixB,
      randomUUID: Math.round(Math.random() * 1000000),
    },
  });

  const startTime = Date.now();
  const res = http.post(__ENV.API_URL, PAYLOAD, {
    headers: {
      "Content-Type": "application/json",
    },
  });
  const endTime = Date.now();
  const executionTimeWithNetwork = endTime - startTime;

  try {
    const responseBody = JSON.parse(res.body);
    const executionTime = responseBody?.executionTime
      ? parseInt(responseBody.executionTime)
      : 0;

    const latency = executionTime
      ? executionTimeWithNetwork - executionTime
      : executionTimeWithNetwork;

    results.push({
      testId: __ENV.TEST_ID,
      success: responseBody?.runTime ? true : false,
      cloudProvider: responseBody?.cloudProvider,
      region: responseBody?.region,
      runTime: responseBody?.runTime,
      functionName: responseBody?.functionName,
      isColdStart: responseBody?.isColdStart,
      allocatedMemory: responseBody?.allocatedMemory,
      cpuCores: responseBody?.cpuCores,
      executionTime: responseBody?.executionTime,
      latency: latency,
    });
  } catch (error) {
    results.push({
      cloudProvider: "N/A",
      region: "N/A",
      runTime: "N/A",
      functionName: "N/A",
      isColdStart: false,
      allocatedMemory: 0,
      cpuCores: 0,
      executionTime: 0,
      latency: 0,
      success: false,
    });
  }

  if (__ITER === MAX_ITERATIONS_PER_VU - 1) {
    let cloudProvider = "";
    let region = "";
    let runTime = "";
    let functionName = "";
    let allocatedMemory = "";

    const resultItemWithSuccess = results.find((result) => result.success);

    if (resultItemWithSuccess) {
      cloudProvider = resultItemWithSuccess.cloudProvider;
      region = resultItemWithSuccess.region;
      runTime = resultItemWithSuccess.runTime;
      functionName = resultItemWithSuccess.function;
      allocatedMemory = resultItemWithSuccess.allocatedMemory;
    }

    const resultsWithDetailedErrors = results.map((result) => {
      if (!result.success) {
        result.cloudProvider = cloudProvider;
        result.region = region;
        result.runTime = runTime;
        result.functionName = functionName;
        result.allocatedMemory = allocatedMemory;
      }

      return result;
    });

    saveToDatabase(resultsWithDetailedErrors);
  }
}
