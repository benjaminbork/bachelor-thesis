import process from "process";
import os from "os";
import functions from "@google-cloud/functions-framework";

let isColdStart = true;

functions.http("helloHttp", (req, res) => {
  const startTime = new Date();
  const cpuCores = os.cpus().length;

  try {
    // 1. Prepare the matrix multiplication
    const body = req.body;
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

    res.status(200).send(
      JSON.stringify({
        message: "Matrix mulitplication executed successfully",
        cloudProvider: "GCP Cloud Run Function",
        allocatedMemory: 512,
        cpuCores: cpuCores,
        region: "europe-west3",
        runTime: "Node.js 20.x",
        functionName: "matrix-multiplication",
        isColdStart: wasColdStart,
        executionTime: executionTime,
      })
    );
  } catch (error) {
    res.status(500).send(
      JSON.stringify({
        message: "An error occurred",
        error: error.message,
      })
    );
  }
});
