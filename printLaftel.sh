#!/usr/bin/env bash

# $1 : title
# $2 : year quarter
function print_row {
  printf "[%s] %s\n" "$2" "$1"
}

JSON_DATA=$(cat)

LENGTH=$(echo $JSON_DATA | jq '.results | length')

if [ $LENGTH -eq 0 ];then
  echo "Nothing"
else
  LOOP=$(echo "min($LENGTH-1, 9)" | bc util/min.bc)
  for i in $(seq 0 $LOOP);do
    TITLE=$(echo $JSON_DATA | jq -r ".results[$i].name")
    YEAR_QUARTER=$(echo $JSON_DATA | jq -r ".results[$i].animation_info.air_year_quarter")
    print_row "$TITLE" "$YEAR_QUARTER"
  done
fi
