FROM ubuntu:22.04

ARG DEFAULT_TZ=America/Los_Angeles
ENV DEFAULT_TZ=$DEFAULT_TZ

# Install necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=$DEFAULT_TZ apt-get install -y \
    make build-essential wget curl git llvm \
    openjdk-21-jdk unzip

# Install Kafka
ENV KAFKA_VERSION=3.6.1
RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_2.13-${KAFKA_VERSION}.tgz && \
    tar -xzf kafka_2.13-${KAFKA_VERSION}.tgz -C /opt && \
    rm kafka_2.13-${KAFKA_VERSION}.tgz

# Install Tomcat
ENV TOMCAT_VERSION=11.0.0-M16
RUN wget https://downloads.apache.org/tomcat/tomcat-11/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /opt && \
    rm apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Install Maven
ENV MAVEN_VERSION=3.9.6
RUN wget https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar -xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt && \
    rm apache-maven-${MAVEN_VERSION}-bin.tar.gz

# Install Gradle
ENV GRADLE_VERSION=8.5
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip -d /opt gradle-${GRADLE_VERSION}-bin.zip && \
    rm gradle-${GRADLE_VERSION}-bin.zip

# Set environment variables
ENV JAVA_HOME /usr/lib/jvm/java-21-openjdk-amd64
ENV MAVEN_HOME /opt/apache-maven-${MAVEN_VERSION}
ENV GRADLE_HOME /opt/gradle-${GRADLE_VERSION}
ENV KAFKA_HOME /opt/kafka_2.13-${KAFKA_VERSION}
ENV CATALINA_HOME /opt/apache-tomcat-${TOMCAT_VERSION}

# Add environment variables to the PATH
ENV PATH $PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin:$KAFKA_HOME/bin:$CATALINA_HOME/bin

# Expose ports
EXPOSE 8080 9092

WORKDIR /app

# Start Tomcat
CMD ["catalina.sh", "run"]