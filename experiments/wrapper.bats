#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

@test "wrapper" {
  final_status=0

  for package in $(cat list.txt); do
    if [[ -n $package ]]; then
      package=$package run bats -t test.bats

      echo "# $output" >&3
      echo "#" >&3
      let "final_status += $status"
    fi
  done

  echo "# status $final_status" >&3
  # [ "$final_status" -eq 0 ]
}
