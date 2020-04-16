#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

get_version_from_has() {
  echo "$1" | tr " " "\n" | tail -1
}

@test "test $package" {
  # Ensure inputs
  [ -n "$package" ]
  [ -n "$expected_ver" ]
  [ "$(echo "${package}" | wc -w)" -eq 1 ]
  [ "$(echo "${expected_ver}" | wc -w)" -eq 1 ]

  # Confirm package is installed
  HAS_ALLOW_UNSAFE=y run ../has $package
  echo "$output" >&3
  [ "$status" -eq 0 ]

  # Get actual version (reported from has)
  actual_ver=""
  run get_version_from_has "$output"
  if [ "$status" -eq 0 ]; then
    actual_ver="$output"
    [ -n "$actual_ver" ]
  fi

  # Compare expected with actual
  # We grep instead of direct compare because has adds ansi colors with tput
  [ "$(echo "${actual_ver}" | grep "$expected_ver")" ]
}
