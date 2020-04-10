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
        ack=2.22-1 \
        ant=1.10.5-3~18.04 \
        apache2-utils `#ab` \
        apt-utils=1.6.12 `#todo ` \
        aptitude=0.8.10-6ubuntu1 \
        autojump=22.5.0-2 \
        awscli `#aws` \
        bzr=2.7.0+bzr6622-10 \
        curl=7.58.0-2ubuntu3.8 \
        docker.io `#docker` \
        emacs \
        file \
        gcc \
        git \
        gradle=4.4.1-5ubuntu2~18.04 \
        groovy=2.4.16-1ubuntu1~18.04.1 \
        grunt=1.0.1-8 \
        gulp=3.9.1-6 \
        httpie `#http` \
        hugo=0.40.1-1 \
        jq=1.5+dfsg-2 \
        leiningen `#lein` \
        linuxbrew-wrapper `#brew` \
        make=4.1-9.1ubuntu1 \
        mercurial `#hg` \
        nano=2.9.3-2 \
        nodejs=8.10.0~dfsg-2ubuntu0.4 `#node` \
        npm=3.5.2-0ubuntu4 \
        openjdk-11-jdk-headless `#java #javac` \
        perl6=6.c-1 \
        php \
        postgresql-client `#psql` \
        pv=1.6.6-1 \
        python=2.7.15~rc1-1 \
        python3=3.6.7-1~18.04 \
        r-cran-littler `#R` \
        rake=12.3.1-1ubuntu0.1 \
        ruby \
        ruby-bundler `#bundle` \
        rubygems `#gem` \
        scala=2.11.12-4~18.04 \
        silversearcher-ag `#ag` \
        subversion `#svn` \
        sudo=1.8.21p2-3ubuntu1.2 \
        tree=1.7.0-5 \
        unar=1.10.1-2build3 \
        unzip=6.0-21ubuntu1 \
        vim \
        wget=1.19.4-1ubuntu2.2 \
        xz-utils `#xz` \
        yarn \
        zip=3.0-11build1 \
        zsh=5.4.2-3ubuntu3.1 \
        && apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/*; \
    \
    #bats
    commit="87b16eb"; \
    curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
    "bats-core-bats-core-${commit}/install.sh" /usr/local; \
    \
    #hub
    curl -fsSL https://github.com/github/hub/raw/master/script/get | bash -s 2.14.2
