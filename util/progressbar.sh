#!/usr/bin/env bash

BAR="████████████████████"
BAR_BG="░░░░░░░░░░░░░░░░░░░░"
W=$(echo "scale=4;" $1 / 100 \* 20 | bc)
W=$(printf "%.0f" $W)
if [ "$W" -lt 0 ];then
  W=0
fi
PROGRESS=${BAR:0:$W}

printf "%s%s" $PROGRESS "${BAR_BG:${#PROGRESS}}"
