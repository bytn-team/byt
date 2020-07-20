FROM debian:stretch
LABEL maintainer="BYTN Developers <dev@bytn.org>"
LABEL description="Dockerised BYTNCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
