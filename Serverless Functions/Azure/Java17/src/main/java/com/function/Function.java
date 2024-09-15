package com.function;

import com.microsoft.azure.functions.ExecutionContext;
import com.microsoft.azure.functions.HttpMethod;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;
import com.microsoft.azure.functions.annotation.AuthorizationLevel;
import com.microsoft.azure.functions.annotation.FunctionName;
import com.microsoft.azure.functions.annotation.HttpTrigger;

import org.json.JSONObject;
import org.json.JSONArray;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class Function {
    private static boolean isColdStart = true;

    @FunctionName("HttpExample")
    public HttpResponseMessage run(
            @HttpTrigger(
                    name = "req",
                    methods = {HttpMethod.GET, HttpMethod.POST},
                    authLevel = AuthorizationLevel.ANONYMOUS)
            HttpRequestMessage<Optional<String>> request,
            final ExecutionContext context) {

        long startTime = System.currentTimeMillis();
        int cpuCores = Runtime.getRuntime().availableProcessors();
        Map<String, Object> response = new HashMap<>();

        try {
            Optional<String> requestBody = request.getBody();
            JSONObject body = new JSONObject(requestBody.get());
            JSONObject payload = body.getJSONObject("payload");
            JSONArray matrixA = payload.getJSONArray("matrixA");
            JSONArray matrixB = payload.getJSONArray("matrixB");

            int matrixARows = matrixA.length();
            int matrixACols = matrixA.getJSONArray(0).length();
            int matrixBRows = matrixB.length();
            int matrixBCols = matrixB.getJSONArray(0).length();

            if (matrixACols != matrixBRows) {
                throw new Exception(
                        "Matrix A columns must be equal to Matrix B rows for multiplication");
            }
            int[][] result = new int[matrixARows][matrixBCols];

            // 2. Execute the matrix multiplication
            for (int i = 0; i < matrixARows; i++) {
                for (int j = 0; j < matrixBCols; j++) {
                    for (int k = 0; k < matrixACols; k++) {
                        result[i][j] += matrixA.getJSONArray(i).getInt(k) * matrixB.getJSONArray(k).getInt(j);
                    }
                }
            }

            // 3. Collect all metrics
            boolean wasColdStart = isColdStart;
            Function.isColdStart = false;
            long endTime = System.currentTimeMillis();
            long executionTime = endTime - startTime;

            response.put("statusCode", 200);
            response.put("message", "Matrix mulitplication executed successfully");
            response.put("cloudProvider", "Azure Function App");
            response.put("allocatedMemory", 1); // placeholder to get dynamic value watch azure monitor
            response.put("cpuCores", cpuCores);
            response.put("region", "Germany West Central");
            response.put("runTime", "Java 17");
            response.put("functionName", "matrix-multiplication");
            response.put("isColdStart", wasColdStart);
            response.put("executionTime", executionTime);
        } catch (Exception e) {
            response.put("statusCode", 400);
            response.put("message", e.getMessage());
        }
        JSONObject responseJson = new JSONObject(response);
        if (response.get("statusCode").equals(200)) {
            return request.createResponseBuilder(HttpStatus.OK).body(responseJson.toString()).build();
        } else {
            return request.createResponseBuilder(HttpStatus.BAD_REQUEST).body(responseJson.toString()).build();
        }

    }
}
