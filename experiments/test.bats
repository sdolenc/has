#!/usr/bin/env bats

@test "install $package" {
  if ! command -v $package >&3; then
    echo "attempting to install $package"
    apt-get install -y -qq $package | head -5 >&3 || apk add $package | head -5 >&3
    command -v $package >&3
  fi
}
