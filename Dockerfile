FROM python:3.8-alpine

LABEL "com.github.actions.name"="Build Dataflow Flex Template"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

COPY . . 

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
