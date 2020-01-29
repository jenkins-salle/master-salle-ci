#!/bin/bash

set -e

#comentado porque no hace falta levantar la app
#docker-compose up -d quarkus-app

docker-compose run quarkus-build ./mvnw test

docker-compose run quarkus-build ./mvnw verify