echo "#######################################################################"
echo "# Ćwiczenie 4 - Przygotowanie konfiguracji źródła danych dla wykresów #"
echo "#######################################################################"
echo "Ćwiczenie 4.a - przygotowanie źrodła danych centralnego serwera prometheus."
echo ""
echo "Prometheus serwer vm-prometheus (10.200.200.10)"
curl -X POST -H "Content-Type: application/json" -d '{ "id":1, "orgId":1, "name":"PROMETHEUS", "type":"prometheus", "access":"proxy", "url":"http://vm-prometheus:9090", "password":"", "user":"", "database":"grafana-dash", "basicAuth":false, "basicAuthUser":"", "basicAuthPassword":"", "isDefault":false, "jsonData":null }' http://$1:$2@vm-grafana:3000/api/datasources
echo ""
echo "--------------------------------------------------"
echo "Prometheus serwer vm-prometheus (10.200.200.11)"
curl -X POST -H "Content-Type: application/json" -d '{ "id":1, "orgId":1, "name":"INFLUXDB", "type":"influxdb", "access":"proxy", "url":"http://vm-influxdb:8086", "password":"", "user":"", "database":"njmon", "basicAuth":false, "basicAuthUser":"", "basicAuthPassword":"", "isDefault":false, "jsonData":null }' http://$1:$2@vm-grafana:3000/api/datasources
echo ""
echo "--------------------------------------------------"
