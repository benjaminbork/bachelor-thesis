import azure.functions as func
import logging
import os
import time
import json
import numpy as np

app = func.FunctionApp(http_auth_level=func.AuthLevel.FUNCTION)

is_cold_start = True

@app.route(route="http_trigger")
def http_trigger(req: func.HttpRequest) -> func.HttpResponse:
    
    global is_cold_start
    start_time = time.time() * 1000
    cpu_cores = os.cpu_count() 

    try:
        # 1. Prepare the matix multiplication
        body = req.get_json()
        payload = body['payload']
        matrix_A = payload.get('matrixA', [])
        matrix_B = payload.get('matrixB', [])

        matrix_A_Rows = len(matrix_A)
        matrix_A_Columns = len(matrix_A[0])
        matrix_B_Rows = len(matrix_B)
        matrix_B_Columns = len(matrix_B[0])
        
        if (matrix_A_Columns != matrix_B_Rows):
            raise ValueError('Matrix A columns must be equal to Matrix B rows for multiplication')
    

        result = [[0 for _ in range(matrix_A_Columns)] for _ in range(matrix_B_Columns)] 


        # 2. Execute the matrix multiplication
        matrix_A = np.array(matrix_A)
        matrix_B = np.array(matrix_B)
        result = np.dot(matrix_A, matrix_B)

        # 3. Collect all metrics
        was_cold_start = is_cold_start
        is_cold_start = False

        end_time = time.time() * 1000
        execution_time = round(end_time - start_time, 2)


        return json.dumps(
            {
            'message': 'Matrix mulitplication executed successfully',
            'cloudProvider': 'Azure Function App',
            'allocatedMemory': 1, # Placeholder value check montioring
            'cpuCores': cpu_cores,
            'region': 'Germany West Central',
            'runTime': 'python3.9 with numpy',
            'functionName': 'matrix-multiplication',
            'isColdStart': was_cold_start,
            'executionTime': execution_time,
        })

    except Exception as e:
        return json.dumps({
                'statusCode': 400,
                'message': str(e),
            })


