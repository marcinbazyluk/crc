#!/bin/bash

#
# Script for initiate datasources Grafana Project
#

# Variables
shell="/usr/bin/influx"
sqlfile="/scripts/command.sql"

### Create datasources in InfluxDB
echo "###"
echo "# create databases in InfluxDB"
echo "###"

while read -r sql
do
    influx -execute "$sql"
done <  "$sqlfile"
