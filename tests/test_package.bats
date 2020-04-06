#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

@test "install $package" {
  if command -v apt-get 2>&1 >/dev/null; then
    if ! command -v $package >&3; then
      echo "attempting to install $package" >&3
      apt-get install -y -qq $package | head -5 >&3
    fi
  elif command -v apk 2>&1 >/dev/null; then
    if [[ grep -q "^$package$" packages_alpine_skip.txt ]]; then
      skip "skipping because packages_alpine_skip.txt contains $package"
    fi
  fi

  ../has $package >&3
}
