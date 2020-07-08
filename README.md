# Github action to build Dataflow flex template - Python  

This action builds [Dataflow flex templates](https://github.com/GoogleCloudPlatform/python-docs-samples/blob/master/dataflow/flex-templates/streaming_beam/README.md)
Github action to build flex templates for dataflow

## Github actions steps

### Build container
Builds a container with the dataflow job. 

### Creating a Flex Template
To run a template, you need to create a template spec file containing all the necessary information to run the job, such as the SDK information and metadata.

The metadata.json file contains additional information for the template such as the "name", "description", and input "parameters" field.

The template file must be created in a Cloud Storage location, and is used to run a new Dataflow job.

### Example 

In the folder example thare is on exampel with apache-beam.

## TODO 

Set up/ install gcloud 


## How to run the action locally during  development

brew install nektos/tap/act
act -s GCP_PROJECT=ds-playground-237314 -s GCP_BUCKET=ds-playground-237314

