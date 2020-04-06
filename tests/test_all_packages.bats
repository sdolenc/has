#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

@test "test each package" {
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

#todo: test all packages at once