#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

get_version_from_has() {
  echo "$1" | tr " " "\n" | tail -1
}

@test "test $package" {
  run ../has $package
  echo "$output" >&3
  [ "$status" -eq 0 ]

  [ -n $expected_ver ]
  echo "$expected_ver" | grep -q "$(get_version_from_has $package)"
}
