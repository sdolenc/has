#!/usr/bin/env bats

@test "description [backend=$backend,njobs=$njobs]" {
  echo "# Here I am with backend=$backend njobs=$njobs" >&3
}
