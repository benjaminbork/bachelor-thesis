#! /bin/bash

# DATABASE CONFIG
SUPABASE_URL="YOUR_SUPABASE_URL"
SUPABASE_API_KEY="YOUR_SUPABAES_API_KEY"
SUPABASE_TABLE="rq2"

# PAYLOAD SIZES
MEDIUM_PAYLOAD=200

# ALL TEST URLS
## AWS LAMBDA FUNCTIONS
AWS_NODE_URL="YOUR_AWS_NODE_URL"
AWS_PYTHON_WITH_NUMPY_URL="YOUR_AWS_PYTHON_WITH_NUMPY_URL"
## AZURE FUNCTIONS
AZURE_NODE_URL="YOUR_AZURE_NODE_URL"
AZURE_PYTHON_WITH_NUMPY_URL="YOUR_AZURE_PYTHON_WITH_NUMPY_URL"
## GOOGLE CLOUD FUNCTIONS
GCP_NODE_URL="YOUR_GCP_NODE_URL"
GCP_PYTHON_WITH_NUMPY_URL="YOUR_GCP_PYTHON_WITH_NUMPY_URL"

# RUN AWS LAMBDA FUNCTIONS
# NODE 2-10
TEST_ID="rq1-aws-node-2" VIRTUAL_USERS=2 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-node-3" VIRTUAL_USERS=3 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-node-4" VIRTUAL_USERS=4 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-node-5" VIRTUAL_USERS=5 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-node-6" VIRTUAL_USERS=6 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-node-7" VIRTUAL_USERS=7 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-node-8" VIRTUAL_USERS=8 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-node-9" VIRTUAL_USERS=9 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-node-10" VIRTUAL_USERS=10 API_URL=$AWS_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
# PYTHON WITH NUMPY 2-10
TEST_ID="rq1-aws-python-with-numpy-2" VIRTUAL_USERS=2 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-python-with-numpy-3" VIRTUAL_USERS=3 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-python-with-numpy-4" VIRTUAL_USERS=4 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-python-with-numpy-5" VIRTUAL_USERS=5 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-python-with-numpy-6" VIRTUAL_USERS=6 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-python-with-numpy-7" VIRTUAL_USERS=7 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-python-with-numpy-8" VIRTUAL_USERS=8 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-python-with-numpy-9" VIRTUAL_USERS=9 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-aws-python-with-numpy-10" VIRTUAL_USERS=10 API_URL=$AWS_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
# RUN AZURE FUNCTIONS
## NODE 2-10
TEST_ID="rq1-azure-node-2" VIRTUAL_USERS=2 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-node-3" VIRTUAL_USERS=3 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-node-4" VIRTUAL_USERS=4 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-node-5" VIRTUAL_USERS=5 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-node-6" VIRTUAL_USERS=6 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-node-7" VIRTUAL_USERS=7 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-node-8" VIRTUAL_USERS=8 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-node-9" VIRTUAL_USERS=9 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-node-10" VIRTUAL_USERS=10 API_URL=$AZURE_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
## PYTHON WITH NUMPY 2-10
TEST_ID="rq1-azure-python-with-numpy-2" VIRTUAL_USERS=2 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-python-with-numpy-3" VIRTUAL_USERS=3 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-python-with-numpy-4" VIRTUAL_USERS=4 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-python-with-numpy-5" VIRTUAL_USERS=5 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-python-with-numpy-6" VIRTUAL_USERS=6 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-python-with-numpy-7" VIRTUAL_USERS=7 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-python-with-numpy-8" VIRTUAL_USERS=8 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-python-with-numpy-9" VIRTUAL_USERS=9 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-azure-python-with-numpy-10" VIRTUAL_USERS=10 API_URL=$AZURE_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
# RUN GOOGLE CLOUD FUNCTIONS
## NODE 2-10
TEST_ID="rq1-gcp-node-2" VIRTUAL_USERS=2 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-node-3" VIRTUAL_USERS=3 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-node-4" VIRTUAL_USERS=4 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-node-5" VIRTUAL_USERS=5 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-node-6" VIRTUAL_USERS=6 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-node-7" VIRTUAL_USERS=7 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-node-8" VIRTUAL_USERS=8 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-node-9" VIRTUAL_USERS=9 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-node-10" VIRTUAL_USERS=10 API_URL=$GCP_NODE_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
## PYTHON WITH NUMPY 2-10
TEST_ID="rq1-gcp-python-with-numpy-2" VIRTUAL_USERS=2 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-python-with-numpy-3" VIRTUAL_USERS=3 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-python-with-numpy-4" VIRTUAL_USERS=4 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-python-with-numpy-5" VIRTUAL_USERS=5 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-python-with-numpy-6" VIRTUAL_USERS=6 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-python-with-numpy-7" VIRTUAL_USERS=7 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-python-with-numpy-8" VIRTUAL_USERS=8 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-python-with-numpy-9" VIRTUAL_USERS=9 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
TEST_ID="rq1-gcp-python-with-numpy-10" VIRTUAL_USERS=10 API_URL=$GCP_PYTHON_WITH_NUMPY_URL PAYLOAD_SIZE=$MEDIUM_PAYLOAD SUPABASE_URL=$SUPABASE_URL SUPABASE_API_KEY=$SUPABASE_API_KEY SUPABASE_TABLE=$SUPABASE_TABLE  k6 run k6-script.js
