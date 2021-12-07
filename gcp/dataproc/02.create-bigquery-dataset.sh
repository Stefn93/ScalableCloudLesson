#!/bin/bash

source ./00.variables.sh

bq --location=${BIGQUERY_ZONE} \
mk ${GCP_PROJECT}:${BIGQUERY_DATASET_NAME}