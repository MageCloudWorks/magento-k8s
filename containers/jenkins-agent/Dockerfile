FROM docker.io/jenkins/inbound-agent:jdk11
LABEL maintainer="laurence@magecloudworks.co.uk"

# based on https://github.com/jenkinsci/docker/blob/master/README.md
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y kubernetes-client yamllint shellcheck curl && rm -rf /var/lib/apt/lists/*

# drop back to the regular jenkins user - good practice
USER jenkins

