#!/bin/sh
/usr/bin/curl \
  -X POST \
  -s \
  --data-urlencode "payload={ \
      \"channel\": \"#$SLACK_CHANNEL\", \
      \"username\": \"$SLACK_USERNAME\", \
      \"pretext\": \"$SLACK_PRETEXT | $MONIT_DATE\", \
      \"color\": \"danger\", \
      \"icon_emoji\": \":x:\", \
      \"text\": \"$MONIT_SERVICE - $MONIT_DESCRIPTION\" \
  }" \
  $SLACK_WEBHOOK
