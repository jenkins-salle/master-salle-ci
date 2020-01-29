#!/bin/bash

set -e

#deshabilitado, en caso que la imagen exista, la ejecuta
#docker-compose build quarkus-build

# package for build quarkus-app
docker-compose run quarkus-build ./mvnw package -DskipTests
docker-compose build quarkus-app

