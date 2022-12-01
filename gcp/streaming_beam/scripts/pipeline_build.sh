gcloud builds submit --tag "$TEMPLATE_IMAGE" . 

gcloud dataflow flex-template build $TEMPLATE_PATH \
  --image "$TEMPLATE_IMAGE" \
  --sdk-language "PYTHON" \
  --metadata-file "metadata.json" 
