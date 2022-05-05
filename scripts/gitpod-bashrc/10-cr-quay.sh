#!/usr/bin/env bash
# Quay.io Continer registry

if [ -n "${QUAY_USERNAME}" ]; then
    msg "${BLUE}Logging into Quay.io as:${NOFORMAT} ${QUAY_USERNAME}"
    # Quay password is already base64 encoded
    if ! echo -n "${QUAY_PASSWORD}" | docker login -u="${QUAY_USERNAME}" --password-stdin quay.io > /dev/null 2>&1 ; then
        msg "${RED}Error Logging into Quay.io.  Check your QUAY_USERNAME and QUAY_PASSWORD Gitpod variables.${NOFORMAT}"
    fi
    msg ""
fi