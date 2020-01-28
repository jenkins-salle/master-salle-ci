#!/bin/bash

set -e

docker-compose down || true

docker rm -f "$(docker ps -qa)" || true
