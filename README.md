# moh-RADAR

Technology Radar by Thoughtworks is a tool for visualizing the technologies that a team or organization is using, plans to use, or plans to assess in the future.

The Radar diagram is divided into four quadrants and four rings.

## Quadrants

### 1. Development, Test and Release Tools

This quadrant contains technologies and apps that team members use in their work. These can range from software development kits to unit testing programs to CI/CD pipelines.

### 2. Common Services

The Common Services quadrant contains the services that are used by many applications and serve a more general purpose. Examples of common services are email notification services, monitoring/metric systems and data security managers.

### 3. Execution Environments

Execution environments are generally large-scale technologies that apps are built on. An execution environment might provide a scaffold around which an application is assembled, such as Glassfish, or a generic service an application uses, such as an Oracle database.

### 4. Languages, Frameworks and Platforms

This quadrant describes the programming languages, related frameworks and hosting services that applications are built with. Examples Java and C#, Keycloak and other security platforms, and hosting services like OpenShift and AWS.

## Rings

### 1. Retire

The Retire ring contains items that are no longer in use. These items were deprecated from use and are not a part of the current workflow.

### 2. Deprecate

The Deprecate ring contains items that are still in use but are planned to be retired. Deprecated items likely don't receive support to the same extent as other items and should not be used in new workflows.

### 3. Explore

Items in this ring are normally in use under supervision. People interact with them and apply them to facilitate their work while observing their advantages and drawbacks. These items have passed the initial assessment and are new to the workflow.

### 4. Employ

The innermost ring contains items that are currently in use by the organization and its teams. These items have passed the trial stage and are applied in core stages of the workflow, including in products and organization-scale management practices.

## Running the Radar App Locally

The Radar app can be run locally in Docker. Execute the following commands to pull the image from the [Thoughtworks DockerHub Repo](https://hub.docker.com/r/wwwthoughtworks/build-your-own-radar/).

```
$ docker pull wwwthoughtworks/build-your-own-radar
$ docker run --rm -p 8080:80 -e RINGS="[\"Employ\", \"Explore\", \"Deprecate\", \"Retire\"]" -e QUADRANTS="[\"development_test_and_release_tools\", \"languages_frameworks_and_platforms\", \"common_services\", \"execution_environments\"]" wwwthoughtworks/build-your-own-radar:latest
```

This will pull the image and run it with the rings Employ, Explore, Deprecate, and Retire, and quadrants development_test_and_release_tools, languages_frameworks_and_platforms, common_services, and execution_environments.

To access the running app visit http://localhost:8080. There you can enter the URL of a publicly available .csv file and the app will create your diagram.

Visit https://github.com/thoughtworks/build-your-own-radar for more details.
