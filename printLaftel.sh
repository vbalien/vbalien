#!/usr/bin/env bash

# %1: title
# %2 : year quarter
function print_row {
  printf "%-50s " "$1"
  printf "%-15s\n" "$2"
}

json_data=$(cat)

LENGTH=$(echo $json_data | jq '.results | length')

if [ $LENGTH -eq 0 ];then
  echo "Nothing"
else
  LOOP=$(echo "min($LENGTH-1, 9)" | bc util/min.bc)
  for i in $(seq 0 $LOOP);do
    TITLE=$(echo $json_data | jq -r ".results[$i].name")
    YEAR_QUARTER=$(echo $json_data | jq -r ".results[$i].animation_info.air_year_quarter")
    print_row "$TITLE" "$YEAR_QUARTER"
  done
fi
