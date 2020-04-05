#!/usr/bin/env bats

@test "install $package" {
  command -v $package >&3 || true
  apt-get install -y $package >&3 || apk add $package >&3
  command -v $package >&3
}
