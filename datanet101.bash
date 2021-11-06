#!/bin/bash
if [[ $ARCHIVAL ]]; then
    sed -i 's/"Archival": false/"Archive": true/' /opt/datanet101/config.json
fi
goal node start
while sleep 1; do
    if [[ -e /opt/datanet101/algod.pid ]]; then
	echo "Ready."
	break
    fi
    echo "waiting..."
done
if [[ ! $ARCHIVAL ]]; then
    goal node catchup $(curl https://raw.githubusercontent.com/fimbaz/algorand-datanet101/master/catchpoint.latest)
fi
tail -f /opt/datanet101/node.log&
while sleep 5; do
    if [[ ! -f /opt/datanet101/algod.pid ]]; then
	continue
    elif ! ps $(< /opt/datanet101/algod.pid); then
	exit 1
    fi
done

