#!/usr/bin/env bats

cd $BATS_TEST_DIRNAME

@test "wrapper" {
  final_status=0

  BACKENDS=( "docker" "singularity" )
  NJOBS=( 1 10 )

  for b in "${BACKENDS[@]}"; do
    for nj in "${NJOBS[@]}"; do
      backend="$b" njobs=$nj run bats -t test.bats

      echo "# $output" >&3
      echo "#" >&3
      final_status+=$status
    done
  done

  [ "$final_status" -eq 0 ]
}
