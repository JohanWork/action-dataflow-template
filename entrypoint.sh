#!/bin/bash

# echo google credntilas to the name google recognices
export GOOGLE_APPLICATION_CREDENTIALS=$(echo $INPUT_GOOGLE_APPLICATION_CREDENTIALS | rev)


# Build image
gcloud builds submit --tag "$INPUT_TEMPLATE_IMAGE"


# Build the Flex Template.
gcloud beta dataflow flex-template build $INPUT_TEMPLATE_PATH \
  --image "$INPUT_TEMPLATE_IMAGE" \
  --sdk-language "PYTHON" \
  --metadata-file "$INPUT_METADATA_PATH"