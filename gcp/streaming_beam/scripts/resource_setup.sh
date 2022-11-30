#!/bin/bash

source ./scripts/flex-variables.txt

# Create a Cloud Storage bucket.
gsutil mb gs://$BUCKET

# Create a Pub/Sub topic and a subscription to that topic. This is a streaming source of data for the sample.
gcloud pubsub topics create $TOPIC
gcloud pubsub subscriptions create --topic $TOPIC $SUBSCRIPTION

# Create a publisher for "positive ratings" that publishes 1 message per minute
# If an App Engine app does not exist for the project, this step will create one.
gcloud scheduler jobs create pubsub positive-ratings-publisher \
  --schedule="* * * * *" \
  --topic="$TOPIC" \
  --message-body='{"url": "https://beam.apache.org/", "review": "positive"}'

# Start the job.
gcloud scheduler jobs run positive-ratings-publisher

# Create and run another similar publisher for "negative ratings" that
# publishes 1 message every 2 minutes.
gcloud scheduler jobs create pubsub negative-ratings-publisher \
  --schedule="*/2 * * * *" \
  --topic="$TOPIC" \
  --message-body='{"url": "https://beam.apache.org/", "review": "negative"}'


gcloud scheduler jobs run negative-ratings-publisher


bq mk --dataset "$PROJECT:$DATASET"