#!/bin/bash

source ./00.variables.sh

gsutil rm -r gs://${GCS_BUCKET_NAME}

bq rm -r -f ${GCP_PROJECT}:${BIGQUERY_DATASET_NAME}