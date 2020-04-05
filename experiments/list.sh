#!/bin/bash
set -euo pipefail

pushd "$(dirname "${BASH_SOURCE[0]}")"

grep -o "^ \\+[a-zA-Z0-9_|-]\\+)" ../has | grep -o "[a-zA-Z0-9_|-]\\+" | tr "|" "\\n" | sort > list.txt

popd
