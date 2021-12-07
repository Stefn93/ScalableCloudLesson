#!/bin/bash

source ./00.variables.sh

sh 90.log-time.sh "DELETING CLUSTER '${DATAPROC_CLUSTER_NAME}' ..."

gcloud dataproc clusters delete -q ${DATAPROC_CLUSTER_NAME} --region ${DATAPROC_CLUSTER_REGION}

sh 90.log-time.sh "CLUSTER '${DATAPROC_CLUSTER_NAME}' DELETED!"