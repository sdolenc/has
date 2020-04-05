#!/usr/bin/env bats

@test "install $package" {
  if ! command -v $package >&3; then

    echo "attempting to install $package" >&3
    if command -v apt-get 2>&1 >/dev/null; then
      apt-get install -y -qq $package | head -5 >&3
    else
      apk add $package | head -5 >&3
    fi

    command -v $package >&3
  fi
}
