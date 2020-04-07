FROM ubuntu:bionic-20200311

# already contains
#       apt
#       apt-get
#       awk
#       bash
#       bzip2
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
        libncurses5-dbg `#tput`
