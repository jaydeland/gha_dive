FROM ubuntu:19.10

RUN apt-get update && apt-get upgrade && apt-get install -y wget && \
    wget https://github.com/wagoodman/dive/releases/download/v0.9.1/dive_0.9.1_linux_amd64.deb && \
    apt-get install -y ./dive_0.9.1_linux_amd64.deb && \
    rm -rf dive_0.9.1_linux_amd64

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
