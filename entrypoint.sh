#!/bin/bash

set -e

echo "============================"
echo

FILE="/monit/conf"

echo "set daemon $INTERVAL" > $FILE
echo >> $FILE

IFS=',' read -ra ADRESSES_ARRAY <<< "$ADRESSES"
for A in "${ADRESSES_ARRAY[@]}"
do
  IFS=':' read -ra HOST <<< "$A"
  echo "check host ${HOST[0]} with address ${HOST[0]}" >> $FILE
  echo "  if failed port ${HOST[1]}" >> $FILE
  echo "    then exec \"/monit/slack_notifications_not_ok.sh\"" >> $FILE
  echo "      else if succeeded then exec \"/monit/slack_notifications_ok.sh\"" >> $FILE
  echo >> $FILE
done

cat $FILE

echo
echo "============================"
echo

echo "Starting monit..."
echo

monit -I
