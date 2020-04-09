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
        apache2-utils `#ab` \
        apt-utils `#todo ` \
        aptitude \
        autojump \
        awscli `#aws` \
        bzr \
        curl \
        docker.io `#docker` \
        emacs \
        file \
        gcc \
        git \
        gradle \
        groovy \
        grunt \
        gulp \
        httpie `#http` \
        hugo \
        jq \
        leiningen `#lein` \
        linuxbrew-wrapper `#brew` \
        make \
        mercurial `#hg` \
        nano \
        nodejs `#node` \
        npm \
        openjdk-11-jdk-headless `#java #javac` \
        perl6 \
        php \
        postgresql-client `#psql` \
        pv \
        python \
        python3 \
        r-cran-littler `#R` \
        rake \
        ruby \
        ruby-bundler `#bundle` \
        rubygems `#gem` \
        scala \
        silversearcher-ag `#ag` \
        subversion `#svn` \
        sudo \
        tree \
        unar \
        unzip \
        vim \
        wget \
        xz-utils `#xz` \
        yarn \
        zip \
        zsh \
        && apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/*; \
    \
    #bats
    commit="87b16eb"; \
    curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
    "bats-core-bats-core-${commit}/install.sh" /usr/local; \
    \
    #hub
    curl -fsSL https://github.com/github/hub/raw/master/script/get | bash -s 2.14.2
