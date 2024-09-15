package gcfv2;

import java.io.BufferedWriter;
import java.util.HashMap;
import java.util.Map;

import com.google.cloud.functions.HttpFunction;
import com.google.cloud.functions.HttpRequest;
import com.google.cloud.functions.HttpResponse;
import org.json.JSONArray;
import org.json.JSONObject;

public class HelloHttpFunction implements HttpFunction {
    private static boolean isColdStart = true;

    public void service(final HttpRequest request, final HttpResponse response) throws Exception {
        final BufferedWriter writer = response.getWriter();
        long startTime = System.currentTimeMillis();
        int cpuCores = Runtime.getRuntime().availableProcessors();
        Map<String, Object> responseMap = new HashMap<>();

        try {
            // 1. Prepare the matrix multiplication
            String requestBody = request.getReader().readLine();
            JSONObject body = new JSONObject(requestBody);
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
            HelloHttpFunction.isColdStart = false;
            long endTime = System.currentTimeMillis();
            long executionTime = endTime - startTime;

            responseMap.put("statusCode", 200);

            responseMap.put("message", "Matrix mulitplication executed successfully");
            responseMap.put("cloudProvider", "GCP Cloud Run Function");
            responseMap.put("allocatedMemory", 512);
            responseMap.put("cpuCores", cpuCores);
            responseMap.put("region", "europe-west3");
            responseMap.put("runTime", "Java 17");
            responseMap.put("functionName", "matrix-multiplication");
            responseMap.put("isColdStart", wasColdStart);
            responseMap.put("executionTime", executionTime);
        } catch (Exception e) {
            responseMap.put("statusCode", 400);
            responseMap.put("message", "Matrix mulitplication failed");
            responseMap.put("error", e.getMessage());
        }
        JSONObject responseJson = new JSONObject(responseMap);
        writer.write(responseJson.toString());
    }
}
