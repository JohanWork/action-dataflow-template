#!/bin/bash

export TEMPLATE_IMAGE="gcr.io/$PROJECT/samples/dataflow/streaming-beam:latest"
# Build image
gcloud builds submit --tag "$TEMPLATE_IMAGE" "$PATH_DOCKERFILE"

# Build the Flex Template.
gcloud beta dataflow flex-template build $TEMPLATE_PATH \
  --image "$TEMPLATE_IMAGE" \
  --sdk-language "PYTHON" \
  --metadata-file "metadata.json"