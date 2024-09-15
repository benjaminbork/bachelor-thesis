import os
import time
import json


is_cold_start = True

def lambda_handler(event, context):
    global is_cold_start
    start_time = time.time() * 1000
    cpu_cores = os.cpu_count() 

    try:
        # 1. Prepare the matix multiplication
        body = json.loads(event['body'])
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
        for i in range(matrix_A_Rows):
            for j in range(matrix_B_Columns):
                for k in range(matrix_B_Rows):
                    result[i][j] += matrix_A[i][k] * matrix_B[k][j]

        # 3. Collect all metrics
        was_cold_start = is_cold_start
        is_cold_start = False

        end_time = time.time() * 1000
        execution_time = end_time - start_time
        

        response = {
            'message': 'Matrix mulitplication executed successfully',
            'cloudProvider': 'AWS Lambda',
            'allocatedMemory': 512,
            'cpuCores': cpu_cores,
            'region': os.environ.get('AWS_REGION'),
            'runTime': 'python3.9',
            'functionName': 'matrix-multiplication',
            'isColdStart': was_cold_start,
            'executionTime': execution_time,
        }

        return {
            'statusCode': 200,
            'body': json.dumps(response)
        }

    except Exception as e:
        return {
            'statusCode': 400,
            'body': json.dumps({
                'message': 'Matrix mulitplication failed',
                'error': str(e),
            })
        }
