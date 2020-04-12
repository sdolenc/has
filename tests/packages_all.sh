#!/bin/bash
set -euo pipefail

pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null

grep -o "^ \\+[a-zA-Z0-9_|-]\\+)" ../has | grep -o "[a-zA-Z0-9_|-]\\+" | tr "|" "\\n" | sort --ignore-case

popd >/dev/null
