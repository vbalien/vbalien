#!/usr/bin/env bats

load test_helper
fixtures wakatime

@test "Wakatime 0 language units" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .zero_units | ./printWakatime.sh"
  [ $status -eq 0 ]
  [ "$output" = "" ]
}

@test "Wakatime 5 language units" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .five_units | ./printWakatime.sh"
  [ $status -eq 0 ]
  [ ${#lines[@]} -eq 5 ]
}

@test "Wakatime language more than 10 units" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .more_than_ten | ./printWakatime.sh"
  [ $status -eq 0 ]
  [ ${#lines[@]} -eq 10 ]
}