#!/usr/bin/env bash

# $1 : language
# $2 : time string
# $3 : percentage
function print_row {
  printf "%-15s " $1
  printf "%-15s " "$2"
  util/progressbar.sh $3
  printf " %.1f%%\n" $3
}

JSON_DATA=$(cat)

LENGTH=$(echo $JSON_DATA | jq '.data.languages | length')

if [ $LENGTH -eq 0 ];then
  echo "Nothing"
else
  LOOP=$(echo "min($LENGTH-1, 9)" | bc util/min.bc)
  for i in $(seq 0 $LOOP);do
    NAME=$(echo $JSON_DATA | jq -r ".data.languages[$i].name")
    TIMES=$(echo $JSON_DATA | jq -r ".data.languages[$i].text")
    PERCENT=$(echo $JSON_DATA | jq -r ".data.languages[$i].percent")
    print_row $NAME "$TIMES" $PERCENT
  done
fi

