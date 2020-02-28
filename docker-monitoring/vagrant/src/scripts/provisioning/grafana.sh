#!/bin/bash
echo "--------------------------------------------------"
echo "Install basic packages:"
sudo yum install -y wget
echo "--------------------------------------------------"
echo "Download grafana:"
sudo wget -q https://dl.grafana.com/oss/release/grafana-6.0.2-1.x86_64.rpm -P /tmp/
echo "--------------------------------------------------"
echo "Install grafana:"
sudo yum localinstall -y /tmp/grafana-6.0.2-1.x86_64.rpm
echo "--------------------------------------------------"
echo "Startup modification:"
sudo systemctl enable grafana-server
echo "--------------------------------------------------"
echo "Start service:"
sudo systemctl start grafana-server
sudo sleep 30
echo "--------------------------------------------------"
echo "Check status:"
sudo systemctl status grafana-server
echo "--------------------------------------------------"
echo "Change admin password:"
curl -X PUT -H "Content-Type: application/json" -d '{ "oldPassword": "admin","newPassword": "crc2019","confirmNew": "crc2019" }' http://admin:admin@vm-grafana:3000/api/user/password
echo "--------------------------------------------------"
echo "Create InfluxDB data source for njmon stream:"
curl -X POST -H "Content-Type: application/json" -d '{ "id":1, "orgId":1, "name":"NJMON", "type":"influxdb", "access":"proxy", "url":"http://vm-influxdb:8086", "password":"", "user":"", "database":"njmon", "basicAuth":false, "basicAuthUser":"", "basicAuthPassword":"", "isDefault":false, "jsonData":null }' http://admin:crc2019@vm-grafana:3000/api/datasources
curl -X POST -H "Content-Type: application/json" -d '{ "id":1, "orgId":1, "name":"NMON", "type":"influxdb", "access":"proxy", "url":"http://vm-influxdb:8086", "password":"", "user":"", "database":"nmon", "basicAuth":false, "basicAuthUser":"", "basicAuthPassword":"", "isDefault":false, "jsonData":null }' http://admin:crc2019@vm-grafana:3000/api/datasources
echo ""
echo "--------------------------------------------------"
echo "Create PROMETHEUS data source:"
curl -X POST -H "Content-Type: application/json" -d '{ "id":1, "orgId":1, "name":"PROMETHEUS", "type":"prometheus", "access":"proxy", "url":"http://vm-prometheus:9090", "password":"", "user":"", "database":"grafana-dash", "basicAuth":false, "basicAuthUser":"", "basicAuthPassword":"", "isDefault":false, "jsonData":null }' http://admin:crc2019@vm-grafana:3000/api/datasources
echo ""
echo "--------------------------------------------------"
echo "Install clock panel:"
sudo su - grafana -c 'grafana-cli plugins install grafana-clock-panel'
echo "--------------------------------------------------"
