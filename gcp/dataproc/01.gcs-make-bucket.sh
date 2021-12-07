#!/bin/bash

source ./00.variables.sh

gsutil mb -c ${GCS_BUCKET_CLASS} -l ${GCS_BUCKET_ZONE} gs://${GCS_BUCKET_NAME}

