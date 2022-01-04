#!/usr/bin/env bash
#
# Setup initial civo kubectl with ALL cluster imported

script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


. ${script_dir}/lib.sh

CIVO_VERSION=${CIVO_VERSION-"v1.0.5"}

civo() {
    if [ -r $HOME/.kube/config ]; then
        docker run -it --rm -v $HOME/.civo.json:/.civo.json -v $HOME/.kube/config:/root/.kube/config civo/cli:${CIVO_VERSION} $@
    else
        docker run -it --rm -v $HOME/.civo.json:/.civo.json civo/cli:${CIVO_VERSION} $@
    fi
}

if [ -n "${CIVO_API_KEY}" ]; then
    msg "${BLUE}Logging into Civo${NOFORMAT}"
    msg "${BLUE}Pulling civo/cli container${NOFORMAT}"
    if ! docker pull civo/cli:${CIVO_VERSION} > /dev/null 2>&1; then
        msg "${RED}Error pulling civo/cli:${CIVO_VERSION}${NOFORMAT}"
        exit 1
    fi
    touch $HOME/.civo.json
    if ! civo apikey add default "$CIVO_API_KEY" > /dev/null 2>&1; then
        msg "${RED}CIVO API add failed.  Check your CIVO_API_KEY variable.  See README.md for details.${NOFORMAT}"
        exit 1
    fi
    mkdir "${HOME}"/.kube > /dev/null 2>&1
    kubectl config view --raw > "${HOME}"/.kube/config
    # Realias to include kubernetes config"
    for cluster in $(civo k3s list -o custom -f "name"); do
        # Minor bug of some sort in docker out - removing charriage returns
        cluclean=$(echo ${cluster} | tr -d '\r')
        msg "${BLUE}Adding Civo Kubernetes Cluster:${NOFORMAT} ${cluclean}"
        if ! civo k3s config "${cluclean}" --save --merge > /dev/null 2>&1; then
            msg "${RED}Error adding ${cluclean} to kubeconfig.${NOFORMAT}"
        fi
    done
    msg ""
fi