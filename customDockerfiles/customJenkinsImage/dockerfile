FROM jenkins/jenkins:lts-jdk11
USER root

# install Docker client
RUN apt-get update -qq

RUN apt-get install -qq apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"   

RUN apt-get update -qq \
    && apt-get install -y docker-ce -y

RUN usermod -aG docker jenkins

