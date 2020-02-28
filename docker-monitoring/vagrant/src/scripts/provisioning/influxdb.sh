#!/bin/bash
echo "--------------------------------------------------"
echo "Install basic packages:"
sudo yum install -y wget
echo "--------------------------------------------------"
echo "Install epel and jq:"
sudo yum install -y epel-release
sudo yum install -y jq
echo "--------------------------------------------------"
echo "Download and install InfluxDB:"
sudo wget -q https://dl.influxdata.com/influxdb/releases/influxdb-1.7.5.x86_64.rpm -P /tmp/
sudo yum localinstall -y /tmp/influxdb-1.7.5.x86_64.rpm
echo "--------------------------------------------------"
echo "Enable and start InfluxDB:"
sudo systemctl enable influxdb
sudo systemctl start influxdb
sudo sleep 30
echo "--------------------------------------------------"
echo "Create njmon and nmon database:"
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=CREATE DATABASE "njmon"'
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=CREATE DATABASE "nmon"'
echo "--------------------------------------------------"
echo "Show databases:"
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=SHOW DATABASES' | jq '.'
echo "--------------------------------------------------"
echo "Create njmon, nmon user:"
curl "http://vm-influxdb:8086/query" --data-urlencode "q=CREATE USER njmon WITH PASSWORD 'crc2019'" | jq '.'
curl "http://vm-influxdb:8086/query" --data-urlencode "q=CREATE USER nmon WITH PASSWORD 'crc2019'" | jq '.'
echo "--------------------------------------------------"
echo "Give proper credentials for njmon and nmon user:"
curl "http://vm-influxdb:8086/query" --data-urlencode "q=GRANT ALL ON njmon TO njmon" | jq '.'
curl "http://vm-influxdb:8086/query" --data-urlencode "q=GRANT ALL ON njmon TO nmon" | jq '.'
echo "--------------------------------------------------"
echo "Show users:"
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=SHOW USERS' | jq '.'
echo "--------------------------------------------------"
echo "Show credentials for njmon and nmon user:"
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=SHOW GRANTS FOR njmon' | jq '.'
curl -XPOST 'http://vm-influxdb:8086/query' --data-urlencode 'q=SHOW GRANTS FOR nmon' | jq '.'
echo "--------------------------------------------------"
