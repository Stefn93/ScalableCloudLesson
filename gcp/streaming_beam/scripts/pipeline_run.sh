# Run the Flex Template.
gcloud dataflow flex-template run "streaming-beam-`date +%Y%m%d-%H%M%S`" \
    --template-file-gcs-location "$TEMPLATE_PATH" \
    --parameters input_subscription="$SUBSCRIPTION" \
    --parameters output_table="$PROJECT:$DATASET.$TABLE" \
    --region "$REGION"