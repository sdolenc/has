#!/bin/sh
set -euo pipefail

# settings
test_framework="https://github.com/bats-core/bats-core"
commit="87b16eb"
destination_root="/tmp"
destination_path="bats-core"
download_destination="${destination_root}/${destination_path}"

# packages
# todo:draft, will move to dockerfile
# todo:decide if you want bats in the dockerfile or jit
if command -v apt-get 2>&1 >/dev/null; then
    apt-get update -qq && apt-get install -y -qq curl
else
    apk add curl
    # already has awk bash bzip2 grep gzip sed tar unzip wget xz
    # apk add --no-cache ack curl bzr docker emacs file gcc git go gradle hugo jq make nano npm perl php pv python python3 R ruby sudo tree vim yarn zip zsh
fi

# download
if [ ! -d ${download_destination} ]; then
    PREVPWD=$(pwd)
    cd "${destination_root}"

    curl -L "${test_framework}/tarball/${commit}" | tar xz
    mv "bats-core-bats-core-${commit}" "${destination_path}"

    cd "${PREVPWD}"
fi

# install
if command -v bash >/dev/null 2>&1; then
    if ! "${download_destination}/install.sh" /usr/local; then
        echo "retrying with root privileges"
        sudo "${download_destination}/install.sh" /usr/local
    fi
    command -v bats
fi
