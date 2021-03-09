#!/usr/bin/env bats

load test_helper
fixtures laftel

@test "Laftel 0 animation units" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .zero_units | ./printLaftel.sh"
  [ $status -eq 0 ]
  [ "${lines[0]}" = "Nothing" ]
}

@test "Laftel exact match row" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .five_units | ./printLaftel.sh"
  [ $status -eq 0 ]
  [ "${lines[0]}" = "[2021년 1분기] 진격의 거인 The FINAL" ]
}

@test "Laftel 5 animation units" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .five_units | ./printLaftel.sh"
  [ $status -eq 0 ]
  [ ${#lines[@]} -eq 5 ]
}

@test "Laftel animation more than 10 units" {
  run bash -c "cat $FIXTURE_ROOT/data.json | jq .more_than_ten_units | ./printLaftel.sh"
  [ $status -eq 0 ]
  [ ${#lines[@]} -eq 10 ]
}