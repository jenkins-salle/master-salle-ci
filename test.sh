#!/bin/bash

set -ex

docker-compose run quarkus-build ./mvnw test

docker-compose run quarkus-build ./mvnw verify
