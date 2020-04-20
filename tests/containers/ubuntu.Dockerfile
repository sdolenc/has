FROM ubuntu:bionic-20200311

# already contains
#       apt=1.6.12
#       apt-get=1.6.12
#       awk
#       bash=4.4.20
#       bzip2=1.0.6
#       gnu_coreutils=8.28
#       grep=3.1
#       gzip=1.6
#       perl=26
#       sed=4.4
#       tar=1.29
#       tput
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y -qq \
        ack=2.22* \
        ant=1.10.5* \
        apache2-utils `# ab=2.3` \
        apt-utils=1.6.12 `# todo` \
        aptitude=0.8.10* \
        autojump=22.5.0* \
        awscli `# aws=1.14.44` \
        bzr=2.7.0+bzr6622-10 `# bzr=2.8.0` \
        curl=7.58.0* \
        docker.io `# docker=19.03.6` \
        emacs=47.0 `# emacs=25.2.2` \
        file=1:5.32* \
        gcc=4:7.4.0-1ubuntu2.3 `# gcc=7.5.0` \
        git=1:2.17.1* \
        gpg-agent `# todo:apt-key` \
        gradle=4.4.1* \
        groovy=2.4.16* \
        grunt=1.0.1-8 `# grunt=1.2.0` \
        gulp=3.9.1* \
        httpie `# http=0.9.8` \
        hugo=0.40.1* \
        jq=1.5* \
        leiningen `# lein=2.8.1` \
        locales `# required for brew` \
        make=4.1* \
        mercurial `# hg=4.5.3` \
        nano=2.9.3* \
        openjdk-11-jdk-headless `# java=11.0.6 # javac=11.0.6` \
        perl6=6.c-1 `# perl6=2018.03` \
        php=1:7.2+60ubuntu1 `# php=7.2.24` \
        postgresql-client `# psql=10.12` \
        pv=1.6.6* \
        python=2.7.15~rc1-1 `# python=2.7.17` \
        python3=3.6.7-1~18.04 `# python3=3.6.9` \
        r-cran-littler `# R=3.4.4` \
        rake=12.3.1* \
        ruby=1:2.5.1 \
        ruby-bundler `# bundle=1.16.1` \
        rubygems `# gem=2.7.6` \
        scala=2.11.12* \
        silversearcher-ag `# ag=2.1.0` \
        software-properties-common=0.96.24.32.12 `# todo:add-apt-repository` \
        subversion `# svn=1.9.7` \
        sudo=1.8.21* \
        tree=1.7.0* \
        unar=1.10.1* \
        unzip=6.0-21ubuntu1 `# unzip=6.00` \
        vim=2:8.0* \
        wget=1.19.4* \
        xz-utils `# xz=5.2.2` \
        yarn `# yarn=0.32` \
        zip=3.0* \
        zsh=5.4.2*; \
    \
    commit="87b16eb" `# bats=1.2.0`; \
    curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
    "bats-core-bats-core-${commit}/install.sh" /usr/local; \
    \
    brew=2.2.13; \
    git clone --branch ${brew} https://github.com/Homebrew/brew; \
    locale-gen en_US en_US.UTF-8; \
    eval $(brew/bin/brew shellenv); \
    ln -s /brew/bin/brew /usr/local/bin/brew; \
    brew --version; \
    \
    gcloud=289.0.0; \
    curl -L "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${gcloud}-linux-x86_64.tar.gz" | tar xz; \
    \
    gor=1.0.0; \
    curl -L "https://github.com/buger/goreplay/releases/download/v${gor}/gor_${gor}_x64.tar.gz" | tar xz --directory /usr/local/bin; \
    \
    hub=2.14.2; \
    curl -fsSL "https://github.com/github/hub/raw/master/script/get" | bash -s ${hub}; \
    \
    netlifyctl=0.4.0; \
    curl -L "https://github.com/netlify/netlifyctl/releases/download/v${netlifyctl}/netlifyctl-linux-amd64-${netlifyctl}.tar.gz" | tar xz --directory /usr/local/bin; \
    \
    rg=12.0.1; \
    curl -L "https://github.com/BurntSushi/ripgrep/releases/download/${rg}/ripgrep-${rg}-x86_64-unknown-linux-musl.tar.gz" | tar xz; \
    ln -s "/ripgrep-${rg}-x86_64-unknown-linux-musl/rg" /usr/local/bin/rg; \
    \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - `#node and npm`;\
    add-apt-repository -y ppa:ondrej/php `#php5`; \
    add-apt-repository -y ppa:projectatomic/ppa `#podman`; \
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - `#subl`; \
    add-apt-repository -y "deb https://download.sublimetext.com/ apt/stable/" `#subl`; \
    apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y -qq \
        nodejs=12.16.2* `# node=12.16.2 # npm=6.14.4` \
        php5.6=5.6.40* `# php5=5.6.40` \
        podman=1.6.2* \
        sublime-text=3211; \
    ln -s /usr/bin/php5.6 /usr/bin/php5; \
    \
    npm install -g \
        brunch@"=3.0.0" \
        heroku@"=7.39.3" \
        netlify-cli@="2.46.0" `# netlify=2.46.0` \
        serverless@="1.67.3" `# sls=1.67.3`; \
    \
    apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/*

ENV PATH /google-cloud-sdk/bin:$PATH
