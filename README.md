# moh-RADAR

[![Lifecycle:Maturing](https://img.shields.io/badge/Lifecycle-Maturing-007EC6)](https://github.com/bcgov/repomountie/blob/master/doc/lifecycle-badges.md)

The Technology Radar by Thoughtworks serves as a valuable tool for visualizing the current and future technology landscape of a team or organization. When utilized in conjunction with the Configuration Management Database (CMDB), it enhances the understanding and management of the technologies employed.

By integrating the Technology Radar with the CMDB, organizations can leverage the comprehensive view of technology assets and their relationships. The CMDB provides a structured repository of configuration items, including software applications, hardware components, and their dependencies. This information can be synchronized with the Technology Radar to enrich its data and provide a more holistic perspective on the technology ecosystem.

The Radar diagram is divided into four quadrants and four rings. Visit https://radar.ynr9ed-dev.nimbus.cloud.gov.bc.ca to see the MoH RADAR.

## Quadrants

### 1. Platform

Platform in this context refers to the foundational software, services, and tools needed to support and manage MoH applications and their underlying infrastructure. It includes operating systems, databases, container orchestration services, cloud resources, and other infrastructure components that provide a runtime environment for applications. The Platform category encompasses the software stack and infrastructure upon which applications are built, deployed, and run.

### 2. Development Tools and Automation

Development Tools and Automation encompass a wide range of tools, frameworks, and practices used in software development and automation processes. This category includes tools for writing code, automating build and deployment pipelines, managing containers, and orchestrating development workflows. It focuses on enhancing the efficiency, collaboration, and automation of software development and deployment tasks.

### 3. Management and Monitoring (Including Productivity Tools)

This category encompasses tools, processes, and practices for managing, monitoring, and maintaining IT infrastructure, applications, and services. It includes tools for configuration management, monitoring and logging solutions, incident management, and resources that ensure the reliability, security, and performance of IT environments. Additionally, this category includes productivity and collaboration tools that aid in managing and monitoring various aspects of IT operations and enhancing overall workflow efficiency. It provides visibility, control, productivity enhancements, and collaboration capabilities to efficiently manage and monitor IT resources and tasks.

### 4. Languages and Frameworks

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

## Deploying the App

The Ministry of Health RADAR is deployed in an AWS EC2 instance. This repo contains a copy of the Build Your Own Radar project under [/radar](/radar), with some customizations to make the app match other BC Government Health apps, that the deployment is built from. To build the Docker image for the RADAR, run `docker build -t radar ./radar`.

To run the container locally in Docker, use the below command. This will run the image with the rings `Employ`, `Explore`, `Deprecate`, and `Retire`, and quadrants `Platform`, `Development Tools and Automation`, `Management and Monitoring`, and `Languages and Frameworks`. These are the rings and quadrants expected by the CSV data file. To access the running app, visit http://localhost:8080. To use custom data in your RADAR, enter the URL of a publicly available CSV file in the central field. For example, the MoH RADAR uses https://raw.githubusercontent.com/bcgov/moh-RADAR/main/MoH_Radar.csv. Note that the RADAR can only process raw files that are publicly visible.

```bash
$ docker run -p 8080:80 -e RINGS="[\"Employ\", \"Explore\", \"Deprecate\", \"Retire\"]" -e QUADRANTS="[\"Platform\", \"Development Tools and Automation\", \"Management and Monitoring\", \"Languages and Frameworks\"]" radar
```

To deploy the RADAR to the AWS EC2 instance, log in to the `ynr9ed-dev` console and find the ECR repository. Use the suggested login and push commands on that page with the credentials from the account's login portal to push the image to the repository. Finally, to make sure the app picks up the change, delete the current running task in the EC2 service and force a new deployment. Note: if you are using a Windows machine, this process can be difficult. The copy-pasteable commands in the BC Gov AWS Login portal are formatted for a shell terminal rather than a Windows command prompt, but the AWS commands don't always work in a WSL terminal. To get around this, you can carefully copy the environment variables' names and values (without the double quotes) and set them with a `set` command in a Windows command prompt before running your AWS and Docker commands in the same terminal.
