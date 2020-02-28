echo "####################"
echo "# Wbodowana Grupa1 #"
echo "####################"
echo ""
curl -X POST -H "Content-Type: application/json" -d '{
  "name":"Grupa1",
  "orgId":2
}' http://$1:$2@vm-grafana:3000/api/orgs
echo ""
