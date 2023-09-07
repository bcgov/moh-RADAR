# moh-RADAR

The Technology Radar by Thoughtworks serves as a valuable tool for visualizing the current and future technology landscape of a team or organization. When utilized in conjunction with the Configuration Management Database (CMDB), it enhances the understanding and management of the technologies employed.

By integrating the Technology Radar with the CMDB, organizations can leverage the comprehensive view of technology assets and their relationships. The CMDB provides a structured repository of configuration items, including software applications, hardware components, and their dependencies. This information can be synchronized with the Technology Radar to enrich its data and provide a more holistic perspective on the technology ecosystem.

The Radar diagram is divided into four quadrants and four rings.

## Quadrants

### 1. Platform

Platform in this context refers to the foundational software, services, and tools needed to support and manage MoH applications and their underlying infrastructure. It includes operating systems, databases, container orchestration services, cloud resources, and other infrastructure components that provide a runtime environment for applications. The Platform category encompasses the software stack and infrastructure upon which applications are built, deployed, and run.

### 2. Development Tools and Automation

Development Tools and Automation encompass a wide range of tools, frameworks, and practices used in software development and automation processes. This category includes tools for writing code, automating build and deployment pipelines, managing containers, and orchestrating development workflows. It focuses on enhancing the efficiency, collaboration, and automation of software development and deployment tasks.

### 3. Management and Monitoring (Including Productivity Tools)

This category encompasses tools, processes, and practices for managing, monitoring, and maintaining IT infrastructure, applications, and services. It includes tools for configuration management, monitoring and logging solutions, incident management, and resources that ensure the reliability, security, and performance of IT environments. Additionally, this category includes productivity and collaboration tools that aid in managing and monitoring various aspects of IT operations and enhancing overall workflow efficiency. It provides visibility, control, productivity enhancements, and collaboration capabilities to efficiently manage and monitor IT resources and tasks.

### 4. Language and Frameworks

Language and Frameworks refer to programming languages, software frameworks, and development environments used in software development. This category encompasses a variety of programming languages (e.g., Java, Python), frameworks (e.g., Spring Boot, React.js), and development tools that enable the creation and development of software solutions. It focuses on the tools and technologies that developers use to build and maintain applications.

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
$ docker run --rm -p 8080:80 -e RINGS="[\"Employ\", \"Explore\", \"Deprecate\", \"Retire\"]" -e QUADRANTS="[\"Development/Testing/Release Tools\", \"Languages/Frameworks, Platforms\", \"Common Services\", \"Execution Environments\"]" wwwthoughtworks/build-your-own-radar:latest
```

This will pull the image and run it with the rings `Employ`, `Explore`, `Deprecate`, and `Retire`, and quadrants `Development/Testing/Release Tools`, `Languages/Frameworks, Platforms`, `Common Services`, and `Execution Environments`.

To access the running app visit http://localhost:8080. There you can enter the URL of a publicly available .csv file and the app will create your diagram.

To build your own RADAR use the raw version of the CSV file (for example https://raw.githubusercontent.com/bcgov/moh-RADAR/main/MoH_Radar.csv)

Visit https://github.com/thoughtworks/build-your-own-radar for more details.
