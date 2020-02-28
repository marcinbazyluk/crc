#!/bin/bash

#
# Skrypt na potrzeby programu CRC
#

# Variables
shell="/usr/bin/influx"
sqlfile="/scripts/monitor.sql"

### Create datasources in InfluxDB
echo "###"
echo "# Utworzenie oraz zasilenie bazy danych monitor"
echo "###"

while read -r sql
do
    influx -execute "$sql"
done <  "$sqlfile"
