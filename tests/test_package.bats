#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

@test "test $package" {
  # todo: fail if missing right-side version (like wget on alpine)
  ../has $package >&3
}
