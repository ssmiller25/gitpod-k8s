#!/usr/bin/env bash
#
# Setup initial civo kubectl with ALL cluster imported

# Debug
#set -x

#CIVO_VERSION=${CIVO_VERSION-"v1.0.5"}
#
#civo() {
#    if [ -r $HOME/.kube/config ]; then
#        docker run -it --rm -v $HOME/.civo.json:/.civo.json -v $HOME/.kube/config:/root/.kube/config civo/cli:${CIVO_VERSION} $@
#    else
#        docker run -it --rm -v $HOME/.civo.json:/.civo.json civo/cli:${CIVO_VERSION} $@
#    fi
#}
#
#if [ -n "${CIVO_API_KEY}" ]; then
#    docker pull civo/cli:${CIVO_VERSION}
#    touch $HOME/.civo.json
#    if ! civo apikey add default "$CIVO_API_KEY" > /dev/null 2>&1; then
#        echo "CIVO API add failed.  Check your \$CIVO_API_KEY variable.  See README.md for details."
#        exit 1
#    fi
#    mkdir "${HOME}"/.kube > /dev/null 2>&1
#    kubectl config view --raw > "${HOME}"/.kube/config
#    # Realias to include kubernetes config"
#    for cluster in $(civo k3s list -o custom -f "name"); do
#        # Minor bug of some sort in docker out - removing charriage returns
#        cluclean=$(echo ${cluster} | tr -d '\r')
#        civo k3s config "${cluclean}" --save --merge
#    done
#fi