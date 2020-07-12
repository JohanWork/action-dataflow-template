# Github action to build Dataflow flex template - Python  

This action builds [Dataflow flex templates](https://github.com/GoogleCloudPlatform/python-docs-samples/blob/master/dataflow/flex-templates/streaming_beam/README.md)
Github action to build flex templates for dataflow. The action expect the GOOGLE_APPLICATION_CREDENTIALS input to be a bas64 encoded service key. To base64 decode a json key you can use 

```bash
    base64 gke_key.josn 
```
You need to have enabled the following api.

- Cloud Build
- Cloud Storage
- Container Registry

To run the action you also need to give the service key access to view all of the project or add viewr to the bucket at least if you want more fine graine control. Connectet to this [issue](https://github.com/GoogleCloudPlatform/github-actions/issues/105)

## Github actions steps

### Build container
Builds a container with the dataflow job. 

### Creating a Flex Template
To run a template, you need to create a template spec file containing all the necessary information to run the job, such as the SDK information and metadata.

The metadata.json file contains additional information for the template such as the "name", "description", and input "parameters" field.

The template file must be created in a Cloud Storage location, and is used to run a new Dataflow job.

### Example 

In the folder example thare is on exampel with apache-beam.

## How to run the action locally during  development

brew install nektos/tap/act
act -s GCP_PROJECT=<your project> -s GCP_BUCKET=<your bucket> -s GKE_KEY=<GKE key base64 decoded>