FROM ubuntu:bionic-20200311

# already contains
#       apt
#       apt-get
#       awk
#       bash
#       bzip2
#       grep
#       gzip
#       perl
#       sed
#       tar
#       tput
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y -qq \
        ack \
        ant \
        aptitude \
        autojump \
        bzr \
        curl \
        emacs \
        file \
        gcc \
        git \
        gradle \
        groovy \
        grunt \
        gulp \
        hugo \
        jq \
        make \
        nano \
        npm \
        perl6 \
        php \
        pv \
        python \
        python3 \
        rake \
        ruby \
        scala \
        sudo \
        tree \
        unar \
        unzip \
        vim \
        wget \
        yarn \
        zip \
        zsh \
        && apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/*
