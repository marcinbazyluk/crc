#!/usr/bin/python3.6

# Kiedy                     Kto                           Opis zmiany
# 01/03/2019                Janusz Kujawa                 Implementacja skryptu na potrzeby użycia 2 zmiennych HOST i LOCATION
#

import json
import time
import random
from influxdb import InfluxDBClient

# Current date in json model type

# Credentials
host="vm-influxdb"
port=8086
user = 'monitor'
password = 'crc2019'
dbname = 'monitor'

# Connection string
client = InfluxDBClient(host, port, user, password, dbname)

# Connect database
client.create_database(dbname)

# Servers list
server_list = (("server1", "eu-south"), ("server2", "eu-north"), ("server3", "eu-east"), ("server4", "eu-west"), \
               ("server5", "eu-west"), ("server6", "eu-north"), ("server7", "eu-east"), ("server8", "eu-east"), \
               ("server9", "eu-south"), ("server10", "eu-south") )

while True:
  for i in server_list :
    server = i[0]
    location = i[1]
    cpu_load_user=round(random.uniform(1,100))
    cpu_load_sys_potential=100-cpu_load_user
    cpu_load_sys=round(random.uniform(1, cpu_load_sys_potential))
    cpu_load_idle=100-cpu_load_user-cpu_load_sys
    print('Insert data for: '+str(server)+' in location: '+str(location)+' data: '+str(cpu_load_user)+','+str(cpu_load_sys)+','+str(cpu_load_idle))

    json_body = [
    {
            "measurement": "cpu",
            "tags": {
                "host": i[0],
                "location": i[1]
            },
            "fields": {
                "user": cpu_load_user,
                "sys": cpu_load_sys,
                "idle": cpu_load_idle
            }
        }
    ]
    client.write_points(json_body)
    print ('--------------------------------------------------------------')

  time.sleep(60)
