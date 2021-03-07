#!/usr/bin/env bash

BAR="████████████████████"
BAR_BG="░░░░░░░░░░░░░░░░░░░░"
W=$(echo "scale=4;" $1 / 100 \* 20 | bc)
W=$(printf "%.0f" $W)
PROGRESS=${BAR:0:$W}

printf "%s%s" $PROGRESS "${BAR_BG:${#PROGRESS}}"