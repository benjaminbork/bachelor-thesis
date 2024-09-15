import process from "process";
import os from "os";

let isColdStart = true;

export const handler = async (event) => {
  const startTime = new Date();
  const cpuCores = os.cpus().length;

  try {
    // 1. Prepare the matrix multiplication
    const body = JSON.parse(event.body);
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
      statusCode: 200,
      body: JSON.stringify({
        message: "Matrix mulitplication executed successfully",
        cloudProvider: "AWS Lambda",
        allocatedMemory: 512,
        cpuCores: cpuCores,
        region: process.env.AWS_REGION,
        runTime: "Node.js 20.x",
        functionName: "matrix-multiplication",
        isColdStart: wasColdStart,
        executionTime: executionTime,
      }),
    };
  } catch (error) {
    return {
      statusCode: 400,
      body: JSON.stringify({
        message: "Matrix mulitplication failed",
        error: error.message,
      }),
    };
  }
};
