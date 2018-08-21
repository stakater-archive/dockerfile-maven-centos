FROM stakater/java-centos:7-1.8

LABEL name="Stakater Maven Image on CentOS" \    
      maintainer="Stakater <stakater@aurorasolutions.io>" \
      vendor="Stakater" \
      release="1" \
      summary="A Maven based image on CentOS" 

# Setting Maven Version that needs to be installed
ARG MAVEN_VERSION=3.5.4

# Changing user to root to install maven
USER root
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Set maven variables
ENV MAVEN_VERSION=${MAVEN_VERSION}
ENV M2_HOME /usr/share/maven
ENV maven.home $M2_HOME
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH

# Set JDK to be 32bit
COPY set_java $M2
RUN ls -l $M2
RUN whoami
RUN $M2/set_java && rm $M2/set_java
RUN java -version

# Again using non-root user i.e. stakater as set in base image
USER 10001

# Define default command, can be overriden by passing an argument when running the container
CMD ["mvn","-version"]
