#!/usr/bin/env bash


CIVO_VERSION=${CIVO_VERSION-"latest"}

civo() {
    if [ -r $HOME/.kube/config ]; then
        docker run -it --rm -v $HOME/.civo.json:/.civo.json -v $HOME/.kube/config:/root/.kube/config civo/cli:${CIVO_VERSION} $@
    else
        docker run -it --rm -v $HOME/.civo.json:/.civo.json civo/cli:${CIVO_VERSION} $@
    fi
}


