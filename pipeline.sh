#!/bin/bash

set -ex

BUILD_VERSION="1.1"
BUILD_IMAGE="mdas/quarkus-build:$BUILD_VERSION"
BUILD_CONTAINER="mdas/quarkus-build:$BUILD_VERSION"

APP_VERSION="1.0"
APP_IMAGE="mdas/quarkus-build:$APP_VERSION"
APP_CONTAINER="mdas/quarkus-build:$APP_VERSION"


#### compile ####
docker build -f Dockerfile.build -t $BUILD_IMAGE .
#docker run -i --rm -v "$PWD":/app -w /app $BUILD_CONTAINER
#docker run -it --rm -v "$PWD":/app -w /app $BUILD_CONTAINER #./mvnw compile -Dmaven.repo.local=/home/dev/.m2/repository
docker run --rm \
  -it \
  -v "$PWD":/app \
  -v "$PWD/home/dev":/home/dev/ \
  -w /app \
  $BUILD_CONTAINER #\
  #./mvnw compile #-Dmaven.repo.local=./repository


#docker build -f src/main/docker/Dockerfile.jvm -t $APP_IMAGE .


#### test ####
#docker run -i --rm -p 8080:8080 $APP_CONTAINER
#docker run --rm -v "$PWD":/app -w /app $BUILD_CONTAINER ./mvnw test


#### static code check ####



#### package ####



#### integration tests ####



#docker build -f src/main/docker/Dockerfile.build.jvm -t quarkus/code-with-quarkus-jvm .
#
#docker run -i --rm -p 8080:8080 quarkus/code-with-quarkus-jvm
