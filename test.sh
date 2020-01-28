#!/bin/bash

set -e

docker-compose up -d quarkus-app

docker-compose run quarkus-build ./mvnw test

