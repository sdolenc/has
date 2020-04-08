#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

distro="alpine"
if command -v apt-get 2>&1 >/dev/null; then
  distro="ubuntu"
fi

@test "test each package individually" {
  final_status=0

  for package in $(cat packages_all.txt); do
    if [[ -n $package ]]; then
      package=$package distro=$distro run bats -t test_package.bats
      echo "# $output" >&3
      echo "#" >&3
      final_status=$(($final_status + $status))
    fi
  done

  echo "# status code=$final_status" >&3
  [ "$final_status" -eq 0 ]
}

@test "test all packages at once" {
  # subtract skips from full list
  run ../has $(egrep -v "$(cat packages_${distro}_skip.txt | xargs | tr " " "|")" packages_all.txt | xargs)
  echo "$output" >&3
  echo "#" >&3

  echo "# status code=$status" >&3
  [ "$status" -eq 0 ]
}
