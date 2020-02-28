<!--
# Przygotowania:

Z poziomu użytkownika student wykonaj:

```
mkdir lab;cd lab
git clone https://jankujawa:8f959a15d4e19e57a2b4356d489390f140e79b7c@github.ibm.com/CRC/docker-monitoring.git
```

Po wykonaniu tej operacji powinien zostać stworzony katalog ***docker-monitoring***. Wchodzimy do niego a następnie inicjalizujemy laboratorium za pomocą komendy docker-compose

```
cd docker-monitoring
docker compose up -d
```

`Wykonywana czynność może zająć chwilę! W przypadku błędu podczas inicjalizacji laboratorium proszę poprosić o pomoc instruktora.`
-->

<!--
# Przygotowania
[Przygotowanie laba!](cwiczenia/0/przygotuj.md)
-->

# "Docker monitoring - zeszyt ćwiczeń"



## Sesja 1 - Podstawy

### Ćwiczenie 1
[Pierwsze logowanie i zmiana hasła użytkownika.](cwiczenia/1/cwiczenie1.md)

### Cwiczenie 2
[Tworzenie użytkowników, organizacji oraz nadawanie uprawnień.](cwiczenia/2/cwiczenie2.md)

### Cwiczenie 3
[Tworzenie folderów oraz importowanie grafów w formacie json.](cwiczenia/3/cwiczenie3.md)

### Cwiczenie 4
[Instalacja pluginów oraz rozszerzanie funkcjonalności systemu.](cwiczenia/4/cwiczenie4.md)

### Cwiczenie 5
[WorldPing - konfiguracja.](cwiczenia/5/cwiczenie5.md)

### Cwiczenie 6
[Grafana hosting jako alternatywa dla self hostingu.](cwiczenia/6/cwiczenie6.md)

### Cwiczenie 7

[Grafy - nawigacja, selekcja danych, strojenie systemu.](cwiczenia/7/cwiczenie7.md)

### Cwiczenie 8
[Konfiguracja node exportera dla monitoringu bazy danych MySQL/MariaDB](cwiczenia/8/cwiczenie8.md)

### Cwiczenie 9
[Konfiguracja telegraf jako alternatywa dla node exportera.](cwiczenia/9/cwiczenie9.md)

### Cwiczenie 10
["Playlista" co to takiego i jak jej używać.](cwiczenia/10/cwiczenie10.md)

___

## Sesja 2 - Kontynuacja zagadnienia rozszerzone

### Cwiczenie 11
[Prometheus server ogólna koncepcja, dodawanie i rozszerzanie konfiguracji.](cwiczenia/11/cwiczenie11.md)

### Cwiczenie 12
[Monitorowanie serwerów z użyciem NMON.](cwiczenia/12/cwiczenie12.md)

### Cwiczenie 13
[Konfiguracja reverse proxy z ssl (Grafana, Prometheus)](cwiczenia/13/cwiczenie13.md)

### Cwiczenie 14
[Konfiguracja mechanizmu OAuth oraz odzyskiwanie hasła użytkownika admin](cwiczenia/14/cwiczenie14.md)

### Cwiczenie 15
[Tworzenie grafu w oparciu o InfluxDB i własny skrypt zasilający baze danych.](cwiczenia/15/cwiczenie15.md)

### Cwiczenie 16
[Prometheus server integracja alert managera z slack - własne reguły powiadomień.](cwiczenia/16/cwiczenie16.md)

<!--
### Cwiczenie 17
[Konfiguracja mechanizmu powiadomień z użyciem kanałów slacka.](cwiczenia/17/cwiczenie17.md)

### Cwiczenie 18
Konfiguracja monitoringu dla Kubernetes

### Cwiczenie 19
Tworzenie prostego dashboardu z użyciem atom i json lint, wczytanie oraz walidacja w grafanie.

### Cwiczenie 20
Połączenie ansible oraz rest API grafana, tworzenie playbooka na potrzeby prostych zadań administracyjnych.

### Cwiczenie 21 - dodatkowe (wymaga [!przygotowania laboratorium](vagrant/README.md))
[Monitorowanie serwerów z użyciem NMON i NJMON.](cwiczenia/21/cwiczenie21.md)

-->
