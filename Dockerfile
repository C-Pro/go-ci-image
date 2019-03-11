FROM docker
FROM golang:1.11.5-stretch

MAINTAINER Sergey Melekhin <sergey@melekhin.me>
RUN mkdir /cache
ENV GOCACHE /cache
VOLUME /cache

RUN apt update && apt install -y git make postgresql-client
RUN go get github.com/alecthomas/gometalinter && gometalinter --install
COPY --from=0 /usr/local/bin/docker /usr/bin/docker

