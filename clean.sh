#!/bin/bash

set -ex

docker-compose down || true

docker rm -f "$(docker ps -qa)" || true
