FROM docker
FROM golang:1.13.4-stretch

MAINTAINER Sergey Melekhin <sergey@melekhin.me>
RUN mkdir /cache
ENV GOCACHE /cache
ENV DOCKER_HOST: tcp://docker:2375/
VOLUME /cache

RUN apt-get update && apt-get install -y git make postgresql-client
RUN GO111MODULE=on go get github.com/golangci/golangci-lint/cmd/golangci-lint@v1.20.0
COPY --from=0 /usr/local/bin/docker /usr/bin/docker
RUN apt-get install -y python3-pip && pip3 install docker-compose
