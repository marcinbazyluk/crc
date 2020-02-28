# Cwiczenie 16

## Cel

W tym ćwiczenie dowiesz się jak pisać własne reguły powiadomień, oraz w jaki sposób alert manager integruje się ze slackiem. Temat jest bardzo obszerny w związku z tym będziemy bazować na wcześniej przygotowanej konfiguracji. Skupimy się głównie na Prometheus Server oraz Alert Manager. Istnieją też inne możliwości generowania powiadomień np. na podstawie przekroczonych progów (Grafany). Zainteresowanych odsyłam do dokumentacji lub skorzystania z cwiczenia dodatkowego.

## Wymagane elementy

+ Kontenery
  * vm-prometheus
  * vm-grafana
  * vm-alert
  * vm1-os
  * vm2-os
  * vm-apache
  * exp-apache


## Weryfikacja poszczególnych elementów laboratorium:

Po zalogowaniu na serwer z dockerem z poziomu użytkownika studentvm wpisujemy:
```
docker ps -a | egrep "vm-prometheus|vm-grafana|vm-alert|vm[1-2]-os$|vm-apache|exp-apache"
5c49d150ef9f        crcdevops/apache-exp:latest      "/bin/sh -c '/bin/ap…"   25 hours ago        Up 25 hours               0.0.0.0:9117->9117/tcp                                                                                                                                                      exp-apache
3bce156cba72        crcdevops/alert-manager:latest   "/bin/alertmanager -…"   25 hours ago        Up 24 hours               0.0.0.0:9993->9093/tcp                                                                                                                                                      vm-alert
18e84b76e6e4        crcdevops/redhat:latest          "node_exporter"          25 hours ago        Up 25 hours               0.0.0.0:10002->9100/tcp                                                                                                                                                     vm2-os
86a862f124fa        crcdevops/redhat:latest          "node_exporter"          25 hours ago        Up 25 hours               0.0.0.0:10001->9100/tcp                                                                                                                                                     vm1-os
78246239b311        crcdevops/apache:latest          "httpd-foreground"       25 hours ago        Up 25 hours               8080/tcp, 0.0.0.0:81->80/tcp                                                                                                                                                vm-apache
9bb4bd5cfaf8        crcdevops/prometheus:latest      "/bin/prometheus --c…"   25 hours ago        Up 25 hours               0.0.0.0:9999->9090/tcp                                                                                                                                                      vm-prometheus
f40ed5c375fe        crcdevops/grafana:latest         "/run.sh"                25 hours ago        Up 25 hours               0.0.0.0:3000->3000/tcp, 3001/tcp
```

*Jeżeli kontenery nie wystartowały lub nie są uruchomione proszę zapytaj instruktora.*


**Każdy uczestnik warsztatów otrzymuje numer, który przydziela prowadzący ćwiczenia. Poniżej tabela zawierająca numer uczestników oraz unikatowy link "incoming webhook". Link ten należy wstawić w odpowiednim miejscu pliku konfiguracyjnego kontenera vm-alert.**



`Uwaga!`<br/>
Numer z tabeli 1 powinien zgadzać się z numerem maszyny w SoftLayer.


*tabela 1*

| Twój numer | Webhook URL                                                                   |
|----------- |-------------------------------------------------------------------------------|
| studentvm01  | https://hooks.slack.com/services/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 |
| studentvm02  | https://hooks.slack.com/services/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 |
| studentvm03  | https://hooks.slack.com/services/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 |
| studentvm04  | https://hooks.slack.com/services/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 |
| studentvm05  | https://hooks.slack.com/services/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 |
| studentvm06  | https://hooks.slack.com/services/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 |
| studentvm07  | https://hooks.slack.com/services/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 |
| studentvm08  | https://hooks.slack.com/services/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 |
| studentvm09  | https://hooks.slack.com/services/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 |
| studentvm10  | https://hooks.slack.com/services/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 |
| studentvm11  | https://hooks.slack.com/services/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 |
| studentvm12  | https://hooks.slack.com/services/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 |
| studentvm13  | https://hooks.slack.com/services/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 |
| studentvm14  | https://hooks.slack.com/services/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 |
| studentvm15  | https://hooks.slack.com/services/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 |
| studentvm16  | https://hooks.slack.com/services/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 |
| studentvm17  | https://hooks.slack.com/services/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 |
| studentvm18  | https://hooks.slack.com/services/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 |
| studentvm19  | https://hooks.slack.com/services/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 |
| studentvm20  | https://hooks.slack.com/services/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 |


```
Wszystkie polecenia wykonujemy z poziomu użytkownika studentvm
```

## Konfiguracja alert managera

```
[studentvm@docker02 ~]$ docker exec -it --user root vm-alert /bin/sh
/alertmanager # cd /etc/alertmanager/
/etc/alertmanager # pwd
/etc/alertmanager
/etc/alertmanager # ls -la
total 20
drwxr-xr-x    1 nobody   nogroup       4096 Mar 14 12:31 .
drwxr-xr-x    1 root     root          4096 May 20 11:15 ..
-rw-r--r--    1 nobody   nogroup        380 Jan 31 16:31 alertmanager.yml
-rw-rw-r--    1 1002     1002           574 May 20 11:14 config.yml
```

Użyj polecenia ps -ef by dowiedzieć się jaki plik należy edytować w celu skonfigurowania alert managera.



Edytujemy plik konfiguracyjny alert managera aktywując linie odpowiadające za konfiguracje alert managera. Pamiętajcie by zastępując wyrażenia w nawiasach skośnych podać właściwy numerem uczestnika! Należy pamiętać również by uzupełnić pole "api_url". Jest unikatowe dla każdego uczestnika szkolenia, patrz tabela 1. Zapisujemy zmiany oraz wychodzimy z edytora vi.

Plik przed edycją:

```
route:
   receiver: 'slack'

receivers:
- name: 'slack'
#  slack_configs:
#  - channel: '#alerty-crc-<numer przydzielony przez instruktora - tabela 1>'
#    username: 'studentvm-<numer przydzielony przez instruktora - tabela 1>'
#    icon_url: https://avatars3.githubusercontent.com/u/3380462
#    send_resolved: true
#    title: '{{ template "custom_title" . }}'
#    text: '{{ template "custom_slack_message" . }}'
#    api_url: 'https://hooks.slack.com/services/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'

#templates:
#  - /alertmanager/notifications.tmpl
```

Plik po zmianach (przykład dla uczestnika z numerem 1)

```
route:
   receiver: 'slack'

receivers:
- name: 'slack'
  slack_configs:
  - channel: '#alerty-crc-01'
    username: 'studentvm-01'
    icon_url: https://avatars3.githubusercontent.com/u/3380462
    send_resolved: true
    title: '{{ template "custom_title" . }}'
    text: '{{ template "custom_slack_message" . }}'
    api_url: 'https://hooks.slack.com/services/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'

templates:
  - /alertmanager/notifications.tmpl
```


Aby zmiany zostały wczytane należy zamknać połączenie z poziomu konsoli docker wpisujemy (exit), kolejno zrestartować kontener vm-alert.

```
/etc/alertmanager # exit
$ docker restart vm-alert
vm-alert
$ docker ps -a | grep vm-alert
3bce156cba72        crcdevops/alert-manager:latest   "/bin/alertmanager -…"   25 hours ago        Up 1 minutes              0.0.0.0:9993->9093/tcp                                                                                                                                                      vm-alert
```

Sprawdźmy czy zmiany są widoczne i trwałe:

```
docker exec -it vm-alert sh -c "cat /etc/alertmanager/config.yml"
```

# Weryfikacja
Aby zweryfikować poprawność wpisów w pliku konfiguracyjnym alert managera zatrzymamy 1 z kontenerów, monitorowany przez prometheus server. Po zatrzymaniu konetenera vm1-os powinien zostać wygenerowany alert oraz przesłany na wskazany kanał slack'a.

Kontener vm1-os został zatrzymany użyj  http://twój_server:9090/targets by upewnić się czy prometheus server był w stanie wykryć awarie:

![](src/awaria.png "")<br/>

`Jak widać na załączonym screen endpoint vm1-os przestał odpowiadać.`

Uruchamiamy slack desktop skrót znajdziecie na pulpicie. Mamy pierwsze powiadomienie, które mówi nam, że endpoint przestał odpowiadać.
![](src/slack-1.png "")<br/>

Po uruchomieniu kontenera vm1-os na slacku powinien pojawić się nowy event [RESOLVED]:
![](src/slack-2.png "")<br/>

Dodatkowo można zweryfikować status endpointa z poziomu Prometheus'a:
![](src/po-awarii.png "")<br/>

W ramach cwiczenia można zatrzymać inne kontenery będące częścią laboratorium.

Aby zweryfikować status Alert Managera należy użyć następującej strony:

`http://<twój_serwer>:9093/`

Poniżej informacje co pokazuje WebGui:

Bezpośrednio po zalogowaniu widać

**nagłówki reguł oraz zarejestrowane eventy:**<br/>
![](src/alert-manager-1.png "")

Po kliknięci na status zobaczym dwie interesujące nas informacje:

**Status alert managera:**<br/>
![](src/alert-manager-2.png "")

**Detale dotyczące środowiska w jakim został zbudowany (np. wersja go)**<br/>
![](src/alert-manager-3.png "")


## Modyfikacja istniejących reguł
Reguły są częścią integralną konfiguracji Prometheus Servera. Znajdziecie je w kontenerze vm-prometheus. Aby je zmodyfikować należy zalogować się do kontenera używając polecenia docker exec -it. W tym celu z poziomu użytkownika studentvm wpisujemy:

```
$ docker exec -it --user root vm-prometheus sh
```

Kolejno przechodzimy do katalogu gdzie przechowywane są pliki konfiguracyjne:

```
/prometheus # cd /etc/prometheus/
/etc/prometheus # ls -la
total 20
drwxr-xr-x    2 nobody   nogroup       4096 Mar 11 09:50 .
drwxr-xr-x    6 root     root          4096 Mar 11 11:15 ..
lrwxrwxrwx    1 nobody   nogroup         39 Mar  2 15:51 console_libraries -> /usr/share/prometheus/console_libraries
lrwxrwxrwx    1 nobody   nogroup         31 Mar  2 15:51 consoles -> /usr/share/prometheus/consoles/
-rw-rw-r--    1 root     root          2480 Mar 11 09:49 crc-rules-docker.yml
-rw-rw-r--    1 1001     1001           203 Mar  9 15:07 mq-targets.yml
-rw-rw-r--    1 1001     1001          2361 Mar 10 20:08 prometheus.yml
```

Edytujemy plik crc-rules-docker.yml oraz odszukujemy regułę:

```
# High memory usage
- alert: high_memory_usage
  expr: (sum(node_memory_MemTotal) - sum(node_memory_MemFree + node_memory_Buffers + node_memory_Cached) ) / sum(node_memory_MemTotal) * 100 > 50
  for: 2m
  labels:
    severity: warning
  annotations:
    summary: "High memory utilisation for {{ $labels.instance }}"
    description: "{{ $labels.instance }} of job {{ $labels.job }} has high memory utilisation , the utilisation is currently: {{ $value }}%"
```

Zmieniamy wartość progu z 50% na 20% oraz czas trwania z 2 m na 1m. Po zmianach reguła powinna wyglądać następująco:

```
# High memory usage
- alert: high_memory_usage
  expr: (sum(node_memory_MemTotal) - sum(node_memory_MemFree + node_memory_Buffers + node_memory_Cached) ) / sum(node_memory_MemTotal) * 100 > 20
  for: 1m
  labels:
    severity: warning
  annotations:
    summary: "High memory utilisation for {{ $labels.instance }}"
    description: "{{ $labels.instance }} of job {{ $labels.job }} has high memory utilisation , the utilisation is currently: {{ $value }}%"
```

Aby zmiany były widoczne dla prometheus serwera należy go zrestartować. W tym celu wydajemy następujące polecenie:

```
docker restart vm-prometheus
```

## Weryfikacja
Aby potwierdzić, że zmiany zostały wprowadzone poprawnie użyj następującego zestawu komend:


```
docker exec -it --user root vm-prometheus sh -c "cat /etc/prometheus/crc-rules-docker.yml"

docker logs vm-prometheus
```

Aby potwierdzić czy prometheus server podejmie reakcję związaną z dużym zużyciem pamięci potrzebne będzie nam narzędzie stress.

W związku z tym łączymy się do kontenera vm1-os i wydajemy komende stress:

docker exec -it vm1-os bash -c "stress --cpu 8 --io 4 --vm 2 --vm-bytes 10M --timeout 120s"

Po upływie około 2 minut powinien zostać wygenerowany alert na poziomie "warning" i wysłany na kanale slack alerty-crc-<numer_uczestnika> (np. alerty-crc-01)

`Uwaga!``
W pliku konfiguracyjnym crc-rules-docker.yml jest błąd. Bardzo łatwo to sprawdzić a mianowicie:

Z poziomu przeglądarki:

https://<twój_serwer>/prometheus

Kolejno klikając zakładkę Graf wklej zawartość zmiennej expr mianowicie:

```
(sum(node_memory_MemTotal) - sum(node_memory_MemFree + node_memory_Buffers + node_memory_Cached) ) / sum(node_memory_MemTotal) * 100 > 20
```
![](src/blad-celowy-1.png "")

Niestety brak jakich kolwiek wartości zwrotnych.

Popraw regułę uzupełniając każdą nazwę metryki o **_bytes** mianowicie:

```
(sum(node_memory_MemTotal_bytes) - sum(node_memory_MemFree_bytes + node_memory_Buffers_bytes + node_memory_Cached_bytes) ) / sum(node_memory_MemTotal_bytes) * 100 > 20
```

Powtórz operację z użyciem PromQL:

![](src/blad-celowy-2.png "")

Voila, Mamy wartość!

Należy poprawić regułę w pliku /etc/prometheus/crc-rules-docker.yml wedle powyższego klucza oraz ponownie zrestartować kontener vm-prometheus.

Po restarcie i odczekaniu 3 minut powinien zostać wyzwolony alert a informacja o jago wystąpieniu zarejestrowana na slacku:

![](src/slack-pamiec-1.png "")
