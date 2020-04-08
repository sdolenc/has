#!/bin/sh
set -euo pipefail

commit="87b16eb"; \
curl -L "https://github.com/bats-core/bats-core/tarball/${commit}" | tar xz; \
"bats-core-bats-core-${commit}/install.sh" /usr/local && \
command -v bats
