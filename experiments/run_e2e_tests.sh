#!/bin/bash
set -euo pipefail

pushd "$(dirname "${BASH_SOURCE[0]}")"

# get bats
bash get_bats.sh

# run tests
bats -t wrapper.bats

popd
