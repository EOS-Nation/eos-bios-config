#!/bin/bash

# `init` hook
# $1 = operation (either `join`, `boot` or `orchestrate`)

echo "Starting $1 operation"

systemctl stop nodeos.service || true
