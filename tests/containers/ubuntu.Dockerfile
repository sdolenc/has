FROM ubuntu:bionic-20200311

# already contains
#       apt
#       apt-get
#       bash
RUN apt-get update && apt-get install -y -qq \
        ack \
        ant \
        aptitude \
        autojump \
        bzr \
        curl \
        emacs \
        gcc \
        git \
        libncurses5-dbg `#tput`
