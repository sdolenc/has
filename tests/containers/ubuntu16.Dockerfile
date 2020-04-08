FROM ubuntu:xenial-20200212

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y -qq \
        bc \
        pv \
        xz-utils \
        unar \
        make \
        curl \
        && apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/*; \
    \
    commit="87b16eb"; \
    curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
    "bats-core-bats-core-${commit}/install.sh" /usr/local && \
    command -v bats
