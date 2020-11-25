#!/bin/bash

source ./00.variables.sh

bq --location=${BIGQUERY_ZONE} mk wordcount_dataset