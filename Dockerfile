FROM ubuntu:14.04

MAINTAINER Lynckia

# Install dependencies
WORKDIR /opt/licode/scripts
COPY ./scripts /opt/licode/scripts
RUN apt-get update && \
    apt-get install -y git wget curl && \
    ./installUbuntuDeps.sh --cleanup

# Copy & install licode
COPY . /opt/licode
RUN ./installErizo.sh && \
    ../nuve/installNuve.sh

WORKDIR /opt

ENTRYPOINT ["./licode/extras/docker/initDockerLicode.sh"]
