#!/bin/bash

# Build image
gcloud builds submit --tag "$TEMPLATE_IMAGE"


# Build the Flex Template.
gcloud beta dataflow flex-template build $TEMPLATE_PATH \
  --image "$TEMPLATE_IMAGE" \
  --sdk-language "PYTHON" \
  --metadata-file "metadata.json"