ARG GIT_HASH
ARG VERSION
ARG RELEASE_DATE
ARG UPSTREAM_IMAGE
ARG CIVO_VERSION=v1.0.5

FROM civo/cli:${CIVO_VERSION} AS civo

FROM ${UPSTREAM_IMAGE}

# Everthing provided by brew - latest version and all, k8s, shell core
RUN for util in shellcheck kubectl helm kustomize task; do \
  brew install ${util}; \
  done

# Terraform and other requirements
RUN for util in terraform tfsec tflint; do \
  brew install ${util}; \
  done

# TODO: tfdocs

# Civo cloud
COPY --from=civo /usr/local/bin/civo /usr/local/bin/civo 

# Install starship - better cli
RUN brew install starship

# starship configuration
RUN mkdir $HOME/.config || true
COPY scripts/starship.toml $HOME/.config/starship.toml

# bashrc inclusion for custom startup commands - from https://community.gitpod.io/t/how-to-config-bashrc/957/13
COPY scripts/gitpod-bashrc/90-kubectl.sh $HOME/.bashrc.d/
COPY scripts/gitpod-bashrc/95-gitpod-civo-env.sh $HOME/.bashrc.d/
COPY scripts/gitpod-bashrc/99-starship.sh $HOME/.bashrc.d/