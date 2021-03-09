#!/usr/bin/env bash

# %1: title
# %2 : count
function print_row {
  printf "[총 %2s 권] %s \n" "$2" "$1"
}

JSON_DATA=$(cat)

LENGTH=$(echo $JSON_DATA | jq '.items | length')

if [ $LENGTH -eq 0 ];then
  echo "Nothing"
else
  LOOP=$(echo "min($LENGTH-1, 9)" | bc util/min.bc)
  for i in $(seq 0 $LOOP);do
    TITLE=$(echo $JSON_DATA | jq -r ".items[$i].unit_title")
    COUNT=$(echo $JSON_DATA | jq -r ".items[$i].unit_count")
    print_row "$TITLE" "$COUNT"
  done
fi

