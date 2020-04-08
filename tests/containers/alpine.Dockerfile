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
        apache2-utils `#ab` \
        curl \
        bzr \
        docker \
        emacs \
        file \
        gcc \
        git \
        go \
        gradle \
        httpie `#http` \
        hugo \
        jq \
        make \
        mercurial `#hg` \
        nano \
        ncurses `#tput:todo` \
        npm \
        perl \
        php \
        postgresql `#psql` \
        pv \
        python \
        python3 \
        R \
        ruby \
        ruby-bundler `#bundle` \
        subversion `#svn` \
        sudo \
        tree \
        vim \
        yarn \
        zip \
        zsh; \
    \
    #bats
    commit="87b16eb"; \
    curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
    "bats-core-bats-core-${commit}/install.sh" /usr/local && \
    command -v bats \
    \
    #hub
    curl -fsSL https://github.com/github/hub/raw/master/script/get | bash -s 2.14.2 \
    command -v hub