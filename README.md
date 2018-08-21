# dockerfile-maven-centos

This is a CentOS 7 image based which contains Java 1.8 and Maven 3.5.4 installed. The base image used is [stakater/java-centos](https://github.com/stakater/dockerfile-java-centos).

You can run this image by:
`docker run -it stakater/maven-centos:7-1.8-3.5.4 /bin/bash`

This is a builder image that's used in Stakater pipelines to build maven based projects.

The idea of a builder image is it contains tools required to build an image so we don't have to include them in the final image.

The builder image is referenced in a Jenkins kubernetes-plugin containerTemplate configuration. See https://github.com/jenkinsci/kubernetes-plugin#pod-and-container-template-configuration for more details.

## Tags

- 7-1.8-3.5.4: CentOS 7 with java jdk 1.8 and Maven 3.5.4 installed
