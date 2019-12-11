#!/bin/sh
/usr/bin/curl \
  -X POST \
  -s \
  --data-urlencode "payload={ \
      \"channel\": \"#$SLACK_CHANNEL\", \
      \"username\": \"$SLACK_USERNAME\", \
      \"pretext\": \"$SLACK_PRETEXT | $MONIT_DATE\", \
      \"color\": \"good\", \
      \"icon_emoji\": \":white_check_mark:\", \
      \"text\": \"$MONIT_SERVICE - $MONIT_DESCRIPTION\" \
  }" \
  $SLACK_WEBHOOK
