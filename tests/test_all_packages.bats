#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

distro="alpine"
if command -v apt-get 2>&1 >/dev/null; then
  distro="ubuntu"
fi
SKIP_FILE=packages_${distro}_skip.txt
DOCKER_FILE=./containers/${distro}.Dockerfile

expected_version() {
  grep -Eo "( |#)${1}=[^\` *-]+" $DOCKER_FILE | tr "=" "\n" | tr ":" "\n" | tail -1
}

@test "test each package individually and verify version" {
  final_status=0

  for package in $(cat list.txt); do
    if [ -n $package ] && ! grep -q "^$package$" $SKIP_FILE; then
      # run expected_version $package
      # [ "$status" -eq 0 ]
      # [ -n "$output" ]

      package="$package" expected_ver="8.28" run bats -t test_package.bats
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
  packages_to_skip="$(grep -Ev "^\s*(#|$)" $SKIP_FILE | xargs | tr " " "|")"
  packages=$(cat list.txt | egrep -Ev "$packages_to_skip" | xargs)

  HAS_ALLOW_UNSAFE=y run ../has $packages
  echo "$output" >&3
  echo "#" >&3

  echo "# status code=$status" >&3
  [ "$status" -eq 0 ]
}
