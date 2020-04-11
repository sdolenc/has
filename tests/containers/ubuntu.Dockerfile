FROM ubuntu:bionic-20200311

# already contains
#       apt=1.6.12
#       apt-get=1.6.12
#       awk
#       bash=4.4.20
#       bzip2=1.0.6
#       grep=3.1
#       gzip=1.6
#       perl=26
#       sed=4.4
#       tar=1.29
#       tput
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y -qq \
        ack=2.22-1 \
        ant=1.10.5-3~18.04 \
        apache2-utils `# ab=2.3` \
        apt-utils=1.6.12 `# todo` \
        aptitude=0.8.10-6ubuntu1 \
        autojump=22.5.0-2 \
        awscli `# aws=1.14.44` \
        bzr=2.7.0+bzr6622-10 `# bzr=2.8.0` \
        curl=7.58.0-2ubuntu3.8 \
        docker.io `# docker=19.03.6` \
        emacs=47.0 `# emacs=25.2.2` \
        file=1:5.32-2ubuntu0.3 \
        gcc=4:7.4.0-1ubuntu2.3 `# gcc=7.5.0` \
        git=1:2.17.1-1ubuntu0.5 \
        gradle=4.4.1-5ubuntu2~18.04 \
        groovy=2.4.16-1ubuntu1~18.04.1 \
        grunt=1.0.1-8 `# grunt=1.2.0` \
        gulp=3.9.1-6 \
        httpie `# http=0.9.8` \
        hugo=0.40.1-1 \
        jq=1.5+dfsg-2 \
        leiningen `# lein=2.8.1` \
        linuxbrew-wrapper `# brew` \
        make=4.1-9.1ubuntu1 \
        mercurial `# hg` \
        nano=2.9.3-2 \
        nodejs=8.10.0~dfsg-2ubuntu0.4 `# node` \
        npm=3.5.2-0ubuntu4 \
        openjdk-11-jdk-headless `# java=11.0.6 # javac=11.0.6` \
        perl6=6.c-1 `# perl6=2018.03` \
        php=1:7.2+60ubuntu1 `# php=7.2.24` \
        postgresql-client `# psql=10.12` \
        pv=1.6.6-1 \
        python=2.7.15~rc1-1 `# python=2.7.17` \
        python3=3.6.7-1~18.04 `# python3=3.6.9` \
        r-cran-littler `# R=3.4.4` \
        rake=12.3.1-1ubuntu0.1 \
        ruby=1:2.5.1 \
        ruby-bundler `# bundle=1.16.1` \
        rubygems `# gem=2.7.6` \
        scala=2.11.12-4~18.04 \
        silversearcher-ag `# ag=2.1.0` \
        subversion `# svn=1.9.7` \
        sudo=1.8.21p2-3ubuntu1.2 \
        tree=1.7.0-5 \
        unar=1.10.1-2build3 \
        unzip=6.0-21ubuntu1 `# unzip=6.00` \
        vim=2:8.0.1453-1ubuntu1.3 \
        wget=1.19.4-1ubuntu2.2 \
        xz-utils `# xz=5.2.2` \
        yarn `# yarn=0.32` \
        zip=3.0-11build1 \
        zsh=5.4.2-3ubuntu3.1 \
        && apt-get -y autoremove && apt-get -y clean && rm -rf /var/lib/apt/lists/*; \
    \
    # bats=1.2.0
    commit="87b16eb"; \
    curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
    "bats-core-bats-core-${commit}/install.sh" /usr/local; \
    \
    # hub=2.14.2
    curl -fsSL https://github.com/github/hub/raw/master/script/get | bash -s 2.14.2
