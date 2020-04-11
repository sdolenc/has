#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

distro="alpine"
if command -v apt-get 2>&1 >/dev/null; then
  distro="ubuntu"
fi
SKIP_FILE=packages_${distro}_skip.txt
DOCKER_FILE=./containers/${distro}.Dockerfile

expected_version() {
  grep "$1" $DOCKER_FILE
}

@test "test each package individually" {
  final_status=0

  for package in $(bash packages_all.sh); do
    if [[ -n $package ]]; then
      if ! grep -q "^$package$" $SKIP_FILE; then
        expected_version=""
        run $(expected_version $package)
        if [ "$status" -eq 0 ]; then
          expected_version="$output"
        fi

        package=$package expected_version="$expected_version" run bats -t test_package.bats
        echo "# $output" >&3
        echo "#" >&3
        final_status=$(($final_status + $status))
      fi
    fi
  done

  echo "# status code=$final_status" >&3
  [ "$final_status" -eq 0 ]
}

@test "test all packages at once" {
  # subtract skips from full list
  packages_to_skip="$(grep -Ev "^\s*(#|$)" $SKIP_FILE | xargs | tr " " "|")"
  packages=$(bash packages_all.sh | egrep -Ev "$packages_to_skip" | xargs)

  run ../has $packages
  echo "$output" >&3
  echo "#" >&3

  echo "# status code=$status" >&3
  [ "$status" -eq 0 ]
}
