echo "##############################################"
echo "# Przygotowanie 2 przykładowych użytkowników #"
echo "##############################################"
echo ""
curl -X POST -H "Content-Type: application/json" -d '{"name":"Tester - Jan Kowalski","email":"jan.kowalski@localhost","login":"jkowalski","password":"crc2019" }' http://$1:$2@vm-grafana:3000/api/admin/users
echo ""
echo "----------------------------------------------------------------------------------"
curl -X POST -H "Content-Type: application/json" -d '{ "name":"Developer - Tomasz Szybki","email":"tomasz.szybki@localhost","login":"tszybki","password":"crc2019" }' http://$1:$2@vm-grafana:3000/api/admin/users
echo ""
echo "----------------------------------------------------------------------------------"
echo "Dodajemu użytkowników do organizacji Grupa1:"
echo ""
curl -X POST -H "Content-Type: application/json" -d '{ "loginOrEmail":"jkowalski","role":"Viewer" }' http://$1:$2@vm-grafana:3000/api/orgs/2/users
curl -X POST -H "Content-Type: application/json" -d '{ "loginOrEmail":"tszybki","role":"Editor" }' http://$1:$2@vm-grafana:3000/api/orgs/2/users
echo ""
