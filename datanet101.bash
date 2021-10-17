#!/bin/bash

goal node start
while sleep 1; do
    if [[ -e /root/.algorand/algod.pid ]]; then
	echo "Ready."
	break
    fi
    echo "waiting..."
done
if [[ ! $ARCHIVAL ]]; then
    goal node catchup $(curl https://raw.githubusercontent.com/fimbaz/algorand-datanet101/master/catchpoint.latest)
fi
tail -f /root/.algorand/node.log&
while sleep 5; do
    if [[ ! -f /root/.algorand/algod.pid ]]; then
	continue
    elif ! ps $(< /root/.algorand/algod.pid); then
	exit 1
    fi
done

