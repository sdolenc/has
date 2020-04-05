#!/usr/bin/env bats

@test "install $package" {
  if ! command -v $package >&3; then
    apt-get install -y $package >&3 || apk add $package >&3
    command -v $package >&3
  fi
}
