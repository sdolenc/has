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
#       tput
RUN apt-get update && apt-get install -y -qq \
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
        vim \
        wget \
        yarn \
        zsh
