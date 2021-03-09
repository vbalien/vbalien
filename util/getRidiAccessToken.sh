#!/usr/bin/env bash

PHP_SESSION=$(curl -I https://ridibooks.com/account/action/login\?jsonp_callback=cb\&user_id=$RIDI_USER_ID\&password=$RIDI_USER_PW\&auto_login=0 \
  2> /dev/null \
  | gawk 'match($0, /^set-cookie: PHPSESSID=([^;]+)/, ary) { print ary[1]; exit; }')

curl --location -I "https://account.ridibooks.com/ridi/authorize/?client_id=$RIDI_CLIENT_ID&redirect_uri=https:%2F%2Faccount.ridibooks.com%2Fridi%2Fcomplete" \
  --header "Cookie: PHPSESSID=$PHP_SESSION;" \
  2> /dev/null \
  | gawk 'match($0, /^set-cookie: ridi-at=([^;]+)/, ary) { print ary[1]; exit; }'
