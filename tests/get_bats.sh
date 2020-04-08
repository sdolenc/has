#!/bin/sh
set -euo pipefail

# todo: move all of this to dockerfile

# settings
commit="87b16eb"

# download
curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz

# install
"bats-core-bats-core-${commit}/install.sh" /usr/local
command -v bats
