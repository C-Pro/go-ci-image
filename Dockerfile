FROM docker
FROM golang:1.17.0-buster

MAINTAINER Sergey Melekhin <sergey@melekhin.me>
RUN mkdir /cache
ENV GOCACHE /cache
ENV DOCKER_HOST: tcp://docker:2375/
VOLUME /cache

RUN apt-get update && apt-get install -y git make postgresql-client \
    libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip
# Build newer git version
RUN wget https://github.com/git/git/archive/v2.24.1.zip -O git.zip && \
    unzip git.zip && rm git.zip && cd git-* && make prefix=/usr all && \
    make prefix=/usr install && rm -rf git-*
RUN GO111MODULE=on go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.39.0
COPY --from=0 /usr/local/bin/docker /usr/bin/docker
RUN apt-get install -y python3-pip && pip3 install docker-compose
