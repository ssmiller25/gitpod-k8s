# Updated 3/12/2022
FROM gitpod/workspace-full@sha256:b484ad49d47bf70776de1d1333379d6b5f1d56c0a3fc1f31a24eb273ef772e3e

# Latest apt updates
RUN sudo apt-get update && sudo apt-get dist-upgrade -y \
  && sudo rm -rf /var/lib/apt/lists/*

# Base for gitpod-k8s - basic kubernetes, along with shellcheck util
RUN for util in shellcheck kubectl helm kustomize; do \
  brew install ${util}; \
  done

# Act Utility - Run github actions on cli
RUN brew install act

# Install starship - better cli
RUN brew install starship

# starship configuration
RUN mkdir $HOME/.config || true
COPY scripts/starship.toml $HOME/.config/starship.toml

# bashrc inclusion for custom startup commands - from https://community.gitpod.io/t/how-to-config-bashrc/957/13
COPY scripts/gitpod-bashrc/* $HOME/.bashrc.d/

# Copy environment scripts into docker image directly.  These were commands that DID NOT work in bashrc.d...
RUN mkdir $HOME/scripts
COPY scripts/*.sh $HOME/scripts/
