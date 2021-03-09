#!/usr/bin/env bats

load test_helper
fixtures ridi

@test "Ridi 0 units" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .zero_units | ./printRidi.sh"
  [ $status -eq 0 ]
  [ "${lines[0]}" = "Nothing" ]
}

@test "Ridi exact match row" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .ten_units | ./printRidi.sh"
  [ $status -eq 0 ]
  [ "${lines[0]}" = "[총  7 권] 이 멋진 세계에 축복을! 시리즈 " ]
}

@test "Ridi 2 books" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .two_units | ./printRidi.sh"
  [ $status -eq 0 ]
  [ ${#lines[@]} -eq 2 ]
}

@test "Ridi 10 books" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .ten_units | ./printRidi.sh"
  [ $status -eq 0 ]
  [ ${#lines[@]} -eq 10 ]
}