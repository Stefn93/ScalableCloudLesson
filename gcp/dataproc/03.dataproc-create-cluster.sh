#!/bin/bash

source ./00.variables.sh

./90.log-time.sh "STARTING CLUSTER '${DATAPROC_CLUSTER_NAME}' ..."

gcloud dataproc clusters create ${DATAPROC_CLUSTER_NAME} \
--region ${DATAPROC_CLUSTER_REGION} \
--zone ${DATAPROC_CLUSTER_ZONE} 
#--scopes storage-rw

./90.log-time.sh "CLUSTER '${DATAPROC_CLUSTER_NAME}' STARTED!"