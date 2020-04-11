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

  actual_ver=$(get_version_from_has "$output")
  [ -n $actual_ver ]

  echo "# $expected_ver" >&3
  echo "$expected_ver" >&3
  echo "# $actual_ver" >&3
  echo "$actual_ver" >&3

  echo "$expected_ver" | grep -qF $actual_ver
}
