#!/bin/bash

set -ex

#BUILD_VERSION="1.1"
#BUILD_IMAGE="mdas/quarkus-build:$BUILD_VERSION"
#BUILD_CONTAINER="quarkus-build"
#
#APP_VERSION="1.0"
#APP_IMAGE="mdas/quarkus-app:$APP_VERSION"
#APP_CONTAINER="quarkus-app"
#
#
##### compile ####
#docker build -f Dockerfile.build -t $BUILD_IMAGE .
##docker run -i --rm -v "$PWD":/app -w /app $BUILD_CONTAINER
##docker run -it --rm -v "$PWD":/app -w /app $BUILD_CONTAINER #./mvnw compile -Dmaven.repo.local=/home/dev/.m2/repository
#docker run --rm \
#  --name $BUILD_CONTAINER \
#  -v "$PWD":/app \
#  $BUILD_IMAGE
##  -it \
##  -w /app \
##  -v "$PWD/home/dev":/home/dev/ \
#  #./mvnw compile #-Dmaven.repo.local=./repository
#
#
#docker build -f src/main/docker/Dockerfile.jvm -t $APP_IMAGE .
#
#
##### test ####
#
## Ejecución de App Container
#docker run --rm \
#  -d \
#  --name $APP_CONTAINER \
#  -p 8080:8080 \
#  $APP_IMAGE
#  # se necesita lanzarlo en background
#
#
## Ejecución de Tests dentro de Build Container
#docker run --rm \
#  --name $BUILD_CONTAINER \
#  -v "$PWD":/app \
#  -w /app \
#  $BUILD_IMAGE \
#  ./mvnw test
#
#
##### static code check ####
#docker run --rm \
#  --name $BUILD_CONTAINER \
#  -v "$PWD":/app \
#  -w /app \
#  $BUILD_IMAGE \
#  ./mvnw pmd:check
#
#
##### package ####
#
#
#
##### integration tests ####
#
#
#
##docker build -f src/main/docker/Dockerfile.build.jvm -t quarkus/code-with-quarkus-jvm .
##
##docker run -i --rm -p 8080:8080 quarkus/code-with-quarkus-jvm
#
#
#


#clean
docker-compose down || true
docker rm -f "$(docker ps -qa)" || true


#build
docker-compose build quarkus-build
docker-compose run quarkus-build ./mvnw package -DskipTests
docker-compose build quarkus-app

#test
docker-compose up -d quarkus-app
docker-compose run quarkus-build ./mvnw test

