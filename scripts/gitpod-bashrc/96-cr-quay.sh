# Quay.io Continer registry

# Get from https://quay.io/user/ssmiller25?tab=settings, CLI password, Docker Login

if [ -n "${QUAY_USERNAME}" ]; then
    docker login -u="${QUAY_USERNAME}" -p="${QUAY_PASSWORD}" quay.io
fi