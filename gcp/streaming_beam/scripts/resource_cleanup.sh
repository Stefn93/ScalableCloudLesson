#!/bin/bash

source ./scripts/flex-variables.txt

gcloud dataflow jobs list \
    --filter 'NAME:streaming-beam AND STATE=Running' \
    --format 'value(JOB_ID)' \
    --region "$REGION" \
  | xargs gcloud dataflow jobs cancel --region "$REGION"

gsutil rm $TEMPLATE_PATH

gcloud container images delete $TEMPLATE_IMAGE --force-delete-tags

gcloud pubsub subscriptions delete $SUBSCRIPTION
gcloud pubsub topics delete $TOPIC

gcloud scheduler jobs delete negative-ratings-publisher
gcloud scheduler jobs delete positive-ratings-publisher

bq rm -f -t $PROJECT:$DATASET.$TABLE

bq rm -r -f -d $PROJECT:$DATASET

gsutil rm -r gs://$BUCKET