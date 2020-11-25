#!/bin/bash

RUN_SESSION=20201126
GCP_PROJECT="unibo-demo"

GCS_BUCKET_NAME=${GCP_PROJECT}-data-bucket
GCS_BUCKET_ZONE=europe-west1
GCS_BUCKET_CLASS=regional

BIGQUERY_DATASET=regional
BIGQUERY_ZONE=europe-west1

DATAPROC_CLUSTER_NAME=unibo-dataproc-cluster-${RUN_SESSION}
DATAPROC_CLUSTER_REGION=europe-west1
DATAPROC_CLUSTER_ZONE=europe-west1-d
DATAPROC_SCALEUP_TO_NUMWORKERS=150
