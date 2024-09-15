import functions_framework
import os
import time
import json
import numpy as np


is_cold_start = True


@functions_framework.http
def hello_http(request):
    global is_cold_start
    start_time = time.time() * 1000
    cpu_cores = os.cpu_count() 

    try:
        # 1. Prepare the matix multiplication
        body = request.get_json()
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
        

        response = {
            'message': 'Matrix mulitplication executed successfully',
            'cloudProvider': 'GCP Cloud Run Function',
            'allocatedMemory': 512,
            'cpuCores': cpu_cores,
            'region': 'europe-west3',
            'runTime': 'python3.9',
            'functionName': 'matrix-multiplication',
            'isColdStart': was_cold_start,
            'executionTime': execution_time,
        }

        return json.dumps(response)

    except Exception as e:
        return json.dumps({
                'statusCode': 400,
                'message': 'Matrix mulitplication failed',
                'error': str(e),
            })
