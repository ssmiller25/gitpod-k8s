#!/usr/bin/env bash
# Docker registry

if [ -n "${DOCKER_USERNAME}" ]; then
    msg "${BLUE}Logging into docker as:${NOFORMAT} ${DOCKER_USERNAME}"
    if ! echo -n "${DOCKER_PASSWORD}" | base64 -d | docker login -u="${DOCKER_USERNAME}" --password-stdin > /dev/null 2>&1; then
        msg "${RED}Error Logging into Docker.  Check your DOCKER_USERNAME and DOCKER_PASSWORD Gitpod variables.${NOFORMAT}"
    fi
    msg ""
fi
