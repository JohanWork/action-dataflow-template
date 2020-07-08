#!/bin/bash
set -e
echo "${INPUT_GOOGLE_APPLICATION_CREDENTIALS}" | base64 -d > "tmp/gcloud.json" 
gcloud auth activate-service-account --key-file="tmp/gcloud.json"

# Build image
gcloud builds submit --tag "$TEMPLATE_IMAGE" "$PATH_DOCKERFILE"

# Build the Flex Template.
gcloud beta dataflow flex-template build $INPUT_TEMPLATE_PATH \
  --image "$INPUT_TEMPLATE_IMAGE" \
  --sdk-language "PYTHON" \
  --metadata-file "$INPUT_METADATA_PATH"