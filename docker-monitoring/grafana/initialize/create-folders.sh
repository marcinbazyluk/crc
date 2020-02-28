echo "###########################################################################"
echo "# Cwiczenie 2 - Tworzenie folderów oraz porzadkowanie pulpitów z grafami. #"
echo "###########################################################################"
echo ""
echo "Cwiczenie 2.a - Utworzenie katalogu na grafy monitorowanych aplikacji oraz web serwerow"
curl -X POST -H "Content-Type: application/json" -d '{
  "id":"1",
  "uid": "ab2gsaa122",
  "title": "Aplikacje",
  "overwrite": true
}' http://$1:$2@vm-grafana:3000/api/folders
echo ""
echo "------------------------------------------------------------------------------"
echo "Cwiczenie 2.b - Utworzenie katalogu na grafy monitorowanych serwerow bazodanowych"
curl -X POST -H "Content-Type: application/json" -d '{
  "id":"2",
  "uid": "aa2psaa144",
  "title": "Bazy-Danych",
  "overwrite": true
}' http://$1:$2@vm-grafana:3000/api/folders
echo ""
echo "------------------------------------------------------------------------------"
echo "Cwiczenie 2.c - Utworzenie katalogu na grafy monitorowanych systemów operacyjnych"
curl -X POST -H "Content-Type: application/json" -d '{
  "id":"3",
  "uid": "aa2psaa147",
  "title": "Systemy",
  "overwrite": true
}' http://$1:$2@vm-grafana:3000/api/folders
echo ""
echo "------------------------------------------------------------------------------"
echo "Cwiczenie 2.d - Utworzenie katalogu na grafy systemów message queue"
curl -X POST -H "Content-Type: application/json" -d '{
  "id":"4",
  "uid": "aa2psaa892",
  "title": "Kolejki",
  "overwrite": true
}' http://$1:$2@vm-grafana:3000/api/folders
echo ""
echo "------------------------------------------------------------------------------"
