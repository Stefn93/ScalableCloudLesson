#!/bin/bash

source ./00.variables.sh

./90.log-time.sh "SCALING UP CLUSTER '${DATAPROC_CLUSTER_NAME}' TO ${DATAPROC_SCALEDOWN_TO_NUMWORKERS} WORKERS ..."

gcloud dataproc clusters update ${DATAPROC_CLUSTER_NAME} \
--region ${DATAPROC_CLUSTER_REGION} \
--num-workers ${DATAPROC_SCALEDOWN_TO_NUMWORKERS}

./90.log-time.sh "CLUSTER '${DATAPROC_CLUSTER_NAME}' NOW SCALED!"