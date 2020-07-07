#!/bin/bash

# echo google credntilas to the name google recognices
export GOOGLE_APPLICATION_CREDENTIALS=$(echo $INPUT_GOOGLE_APPLICATION_CREDENTIALS | rev)


export TEMPLATE_IMAGE="gcr.io/$PROJECT/samples/dataflow/streaming-beam:latest"
# Build image
gcloud builds submit --tag "$TEMPLATE_IMAGE" "$PATH_DOCKERFILE"

# Build the Flex Template.
gcloud beta dataflow flex-template build $INPUT_TEMPLATE_PATH \
  --image "$INPUT_TEMPLATE_IMAGE" \
  --sdk-language "PYTHON" \
  --metadata-file "$INPUT_METADATA_PATH"