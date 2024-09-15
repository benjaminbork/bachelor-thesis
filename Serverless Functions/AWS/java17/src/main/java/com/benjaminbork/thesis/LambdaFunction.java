package com.benjaminbork.thesis;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

public class LambdaFunction implements RequestHandler<Map<String, Object>, Map<String, Object>> {
    private static boolean isColdStart = true;

    @Override
    public Map<String, Object> handleRequest(Map<String, Object> input, Context context) {
        long startTime = System.currentTimeMillis();
        int cpuCores = Runtime.getRuntime().availableProcessors();
        Map<String, Object> responseMap = new HashMap<>();

        try {
            String body = input.get("body").toString();
            JSONObject bodyJson = new JSONObject(body);
            JSONObject payload = bodyJson.getJSONObject("payload");
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
                        result[i][j] += matrixA.getJSONArray(i).getInt(k) *
                                matrixB.getJSONArray(k).getInt(j);
                    }
                }
            }

            // 3. Collect all metrics
            boolean wasColdStart = isColdStart;
            LambdaFunction.isColdStart = false;
            long endTime = System.currentTimeMillis();
            long executionTime = endTime - startTime;

            responseMap.put("statusCode", 200);
            responseMap.put("message", "Matrix mulitplication executed successfully");
            responseMap.put("cloudProvider", "AWS Lambda");
            responseMap.put("allocatedMemory", 512);
            responseMap.put("cpuCores", cpuCores);
            responseMap.put("region", System.getenv("AWS_REGION"));
            responseMap.put("runTime", "Java 17");
            responseMap.put("functionName", "matrix-multiplication");
            responseMap.put("isColdStart", wasColdStart);
            responseMap.put("executionTime", executionTime);

        } catch (Exception e) {
            responseMap.put("statusCode", 400);
            responseMap.put("message", e.getMessage());
        }

        JSONObject responseJson = new JSONObject(responseMap);
        Map<String, Object> response = new HashMap<>();
        response.put("statusCode", responseJson.getInt("statusCode"));
        response.put("body", responseJson.toString());

        return response;

    }
}
