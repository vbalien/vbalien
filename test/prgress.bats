#!/usr/bin/env bats

@test "0% progress bar rendering" {
  run util/progressbar.sh 0
  [ $status -eq 0 ]
  [ "$output" = "░░░░░░░░░░░░░░░░░░░░" ]
}

@test "50% progress bar rendering" {
  run util/progressbar.sh 50
  [ $status -eq 0 ]
  [ "$output" = "██████████░░░░░░░░░░" ]
}

@test "100% progress bar rendering" {
  run util/progressbar.sh 100
  [ $status -eq 0 ]
  [ "$output" = "████████████████████" ]
}

@test "Less than 0% progress bar rendering " {
  run util/progressbar.sh 0
  [ $status -eq 0 ]
  [ "$output" = "░░░░░░░░░░░░░░░░░░░░" ]
}

@test "More than 100% progress bar rendering" {
  run util/progressbar.sh 100
  [ $status -eq 0 ]
  [ "$output" = "████████████████████" ]
}
