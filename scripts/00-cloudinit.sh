#!/usr/bin/env bash
#
# Setup initial civo kubectl with ALL cluster imported


script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. ${script_dir}/lib.sh

msg "${PURPLE}Logging into cloud enviornments${NOCOLOR}"
msg ""

${script_dir}/cloud-civo.sh
${script_dir}/cr-docker.sh
${script_dir}/cr-quay.sh

