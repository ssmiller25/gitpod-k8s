#!/usr/bin/env bash
# Quay.io Continer registry

# Does not work from Gitpod bashrc.d - debug later
#script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
script_dir=/home/gitpod/scripts/

. ${script_dir}/lib.sh

if [ -n "${QUAY_USERNAME}" ]; then
    msg "${BLUE}Logging into Quay.io as:${NOFORMAT} ${QUAY_USERNAME}"
    # Quay password is already base64 encoded
    if ! echo -n "${QUAY_PASSWORD}" | docker login -u="${QUAY_USERNAME}" --password-stdin quay.io > /dev/null 2>&1 ; then
        msg "${RED}Error Logging into Quay.io.  Check your QUAY_USERNAME and QUAY_PASSWORD Gitpod variables.${NOFORMAT}"
    fi
    msg ""
fi