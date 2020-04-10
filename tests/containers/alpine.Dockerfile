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
        ack=3.2.0-r0 \
        apache2-utils `#ab` \
        curl=7.67.0-r0 \
        bzr \
        docker=19.03.5-r0 \
        emacs \
        file \
        gcc \
        git=2.24.1-r0 \
        go \
        gradle=5.6.4-r0 \
        httpie `#http` \
        hugo=0.61.0-r0 \
        jq=1.6-r0 \
        make \
        mercurial `#hg` \
        nano=4.6-r0 \
        ncurses `#tput:todo` \
        npm \
        perl=5.30.1-r0 \
        php \
        postgresql `#psql` \
        pv \
        python \
        python3=3.8.2-r0 \
        R=3.6.2-r0 \
        ruby \
        ruby-bundler `#bundle` \
        subversion `#svn` \
        sudo=1.8.31-r0 \
        tree=1.8.0-r0 \
        vim=8.2.0-r0 \
        yarn=1.19.2-r0 \
        zip \
        zsh=5.7.1-r0; \
    \
    #bats
    commit="87b16eb"; \
    curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
    "bats-core-bats-core-${commit}/install.sh" /usr/local
