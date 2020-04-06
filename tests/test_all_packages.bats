#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

@test "test each package individually" {
  final_status=0

  for package in $(cat packages_all.txt); do
    if [[ -n $package ]]; then
      package=$package run bats -t test_package.bats

      echo "# $output" >&3
      echo "#" >&3
      final_status=$(($final_status + $status))
    fi
  done

  echo "# status $final_status" >&3
  # [ "$final_status" -eq 0 ]
}

@test "test all packages at once" {
  if command -v apt-get 2>&1 >/dev/null; then
    skip "todo"
  fi

  # subtract skips from full list
  run has $(egrep -v "$(cat packages_alpine_skip.txt | xargs | tr " " "|")" packages_all.txt | xargs)
  echo "$output" >&3
  echo "# status $status" >&3
  # [ "$status" -eq 0 ]
}
