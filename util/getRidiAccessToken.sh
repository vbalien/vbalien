#!/usr/bin/env bash
RIDI_CLIENT_ID=$(curl -s https://ridibooks.com/account/login | gawk 'match($0, /^.*oauth2_client_id: '\''(.*)'\''.*$/, ary) { print ary[1]; exit; }')
PHP_SESSION=$(curl -s -I "https://ridibooks.com/account/action/login?jsonp_callback=cb&user_id=$RIDI_USER_ID&password=$RIDI_USER_PW&auto_login=0" \
  | gawk 'match($0, /^set-cookie: PHPSESSID=([^;]+)/, ary) { print ary[1]; exit; }')

curl -L -s -I "https://account.ridibooks.com/ridi/authorize/?client_id=$RIDI_CLIENT_ID&redirect_uri=https:%2F%2Faccount.ridibooks.com%2Fridi%2Fcomplete" \
  -H "Cookie: PHPSESSID=$PHP_SESSION;" \
  | gawk 'match($0, /^set-cookie: ridi-at=([^;]+)/, ary) { print ary[1]; exit; }'
