#!/usr/bin/env bash
# Quay.io Continer registry

# Get from https://quay.io/user/ssmiller25?tab=settings, CLI password, Docker Login

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/lib.sh

if [ -n "${QUAY_USERNAME}" ]; then
    msg "${BLUE}Logging into Quay.io as:${NOFORMAT} ${QUAY_USERNAME}"
    # Quay password is already base64 encoded
    if ! echo -n "${QUAY_PASSWORD}" | docker login -u="${QUAY_USERNAME}" --password-stdin quay.io > /dev/null 2>&1 ; then
        msg "${RED}Error Logging into Quay.io.  Check your QUAY_USERNAME and QUAY_PASSWORD Gitpod variables.${NOFORMAT}"
    fi
    msg ""
fi