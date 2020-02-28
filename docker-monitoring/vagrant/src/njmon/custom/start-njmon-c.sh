#!/bin/bash
echo "Start NJMON Collector, Thanks Nigel!"
mkdir -p /var/njmon
chmod 777 /var/njmon
/usr/local/bin/njmon_collector -p 8181 -d /var/njmon -i -n -X crc2019 -c /usr/local/bin/injector.py
