#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

@test "test $package" {
  if grep -q "^$package$" packages_${distro}_skip.txt; then
    skip
  fi

  # todo: fail if missing right-side version (like wget on alpine)
  ../has $package >&3
}
