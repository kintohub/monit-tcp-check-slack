#!/bin/bash

set -e

MONITRC="/etc/monitrc"
sed -i "s|_PORT_|$PORT|" $MONITRC
sed -i "s|_LOGIN_|$LOGIN|" $MONITRC

echo "============================"
echo

MONIT_CONF="/monit/conf"

echo "set daemon $INTERVAL" > $MONIT_CONF
echo >> $MONIT_CONF

IFS=',' read -ra ADRESSES_ARRAY <<< "$ADRESSES"
for A in "${ADRESSES_ARRAY[@]}"
do
  IFS=':' read -ra HOST <<< "$A"
  echo "check host ${HOST[0]} with address ${HOST[0]}" >> $MONIT_CONF
  echo "  if failed port ${HOST[1]}" >> $MONIT_CONF
  echo "    then exec \"/monit/slack_notifications_not_ok.sh\"" >> $MONIT_CONF
  echo "      else if succeeded then exec \"/monit/slack_notifications_ok.sh\"" >> $MONIT_CONF
  echo >> $MONIT_CONF
done

cat $MONIT_CONF

echo
echo "============================"
echo

echo "Starting monit..."
echo

monit -I
