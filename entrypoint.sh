#!/bin/bash

echo "${INPUT_GOOGLE_APPLICATION_CREDENTIALS}" | base64 -d > "${HOME}/gcloud.json" 
gcloud auth activate-service-account --key-file="${HOME}/gcloud.json" --project "${INPUT_GCP_PROJECT}"

# Build image
gcloud builds submit --tag "$INPUT_IMAGE_TAG" "$INPUT_DOCKERIMAGE_PATH"

echo "$INPUT_TEMPLATE_IMAGE"
echo "$INPUT_TEMPLATE_IMAGE"
echo "$INPUT_TEMPLATE_IMAGE"
# Build the Flex Template.
gcloud beta dataflow flex-template build $INPUT_TEMPLATE_PATH \
  --image "$INPUT_TEMPLATE_IMAGE" \
  --sdk-language "PYTHON" \
  --metadata-file "$INPUT_METADATA_PATH"
