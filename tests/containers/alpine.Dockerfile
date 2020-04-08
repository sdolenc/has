FROM bash:5.0.16

# already contains
#       awk
#       bash
#       bzip2
#       grep
#       gzip
#       sed
#       tar
#       unzip
#       wget
#       xz
RUN apk add --no-cache \
        ack \
        curl \
        bzr \
        docker \
        emacs \
        file \
        gcc \
        git \
        go \
        gradle \
        hugo \
        jq \
        make \
        nano \
        ncurses `#tput` \
        npm \
        perl \
        php \
        pv \
        python \
        python3 \
        R \
        ruby \
        sudo \
        tree \
        vim \
        yarn \
        zip \
        zsh; \
    \
    commit="87b16eb"; \
    curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
    "bats-core-bats-core-${commit}/install.sh" /usr/local && \
    command -v bats
