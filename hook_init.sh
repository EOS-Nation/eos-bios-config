#!/bin/bash -e

# `init` hook
# $1 = operation (either `join`, `boot` or `orchestrate`)

echo "Starting $1 operation"

docker-compose kill || true
docker-compose rm || true