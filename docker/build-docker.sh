#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-bytnpay/bytnd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/bytnd docker/bin/
cp $BUILD_DIR/src/bytn-cli docker/bin/
cp $BUILD_DIR/src/bytn-tx docker/bin/
strip docker/bin/bytnd
strip docker/bin/bytn-cli
strip docker/bin/bytn-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
