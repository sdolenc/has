#!/bin/bash
set -euo pipefail

# todo: remove tis file and call wrapper directly

pushd "$(dirname "${BASH_SOURCE[0]}")"

# get bats
bash get_bats.sh

# run tests
bats -t test_all_packages.bats

popd
