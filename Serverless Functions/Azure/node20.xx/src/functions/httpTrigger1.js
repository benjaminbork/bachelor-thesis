const { app } = require("@azure/functions");
const os = require("os");

let isColdStart = true;

app.http("httpTrigger1", {
  methods: ["GET", "POST"],
  authLevel: "anonymous",
  handler: async (request, context) => {
    const startTime = new Date();
    const cpuCores = os.cpus().length;

    try {
      // 1. Prepare the matrix multiplication
      const body = await request.json();

      const matrixA = body.payload.matrixA || [];
      const matrixB = body.payload.matrixB || [];

      const matrixARows = matrixA.length;
      const matrixACols = matrixA[0].length;
      const matrixBRows = matrixB.length;
      const matrixBCols = matrixB[0].length;

      if (matrixACols !== matrixBRows) {
        throw new Error(
          "Matrix A columns must be equal to Matrix B rows for multiplication"
        );
      }

      const result = Array.from({ length: matrixARows }, () =>
        Array(matrixBCols).fill(0)
      );

      // 2. Eecute the matrix multiplication
      for (let i = 0; i < matrixARows; i++) {
        for (let j = 0; j < matrixBCols; j++) {
          for (let k = 0; k < matrixACols; k++) {
            result[i][j] += matrixA[i][k] * matrixB[k][j];
          }
        }
      }

      // 3. Collect all metrics
      const wasColdStart = isColdStart;
      isColdStart = false;

      const endTime = new Date();
      const executionTime = endTime - startTime;

      return {
        body: JSON.stringify({
          statusCode: 200,
          message: "Matrix mulitplication executed successfully",
          cloudProvider: "Azure Function App",
          allocatedMemory: 1, // Placeholder value watch monitoring
          cpuCores: cpuCores,
          region: "Germany West Central",
          runTime: "Node.js 20.x",
          functionName: "matrix-multiplication",
          isColdStart: wasColdStart,
          executionTime: executionTime,
        }),
      };
    } catch (error) {
      return {
        body: JSON.stringify({
          statusCode: 400,
          message: "Matrix mulitplication failed",
          error: error.message,
        }),
      };
    }
  },
});
