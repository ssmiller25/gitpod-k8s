#!/usr/bin/env bash
# Docker registry

if [ -n "${DOCKER_USERNAME}" ]; then
    echo -n "${DOCKER_PASSWORD}" | base64 -d | docker login -u="${DOCKER_USERNAME}" --password-stdin
fi