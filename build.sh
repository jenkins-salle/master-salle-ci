#!/bin/bash

set -e

docker-compose build quarkus-build

docker-compose run quarkus-build ./mvnw package -DskipTests

docker-compose build quarkus-app

