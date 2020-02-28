FROM influxdb:latest
LABEL author="CRC Team"
LABEL description="InfluxDB engine time series database"
ENTRYPOINT ["/entrypoint.sh"]
#RUN useradd importer && mkdir /usr/local/nmon-importer
#ADD conf/nmon2influxdb/.nmon2influxdb.cfg /home/importer/
ADD automate/scripts/ /scripts/
#COPY automate/nmon-importer/* /usr/local/nmon-importer/
#COPY src/cron/importer /var/spool/cron
#COPY src/bin/nmon2influxdb /usr/local/bin
#COPY automate/njmon/injector.py /usr/local/bin
#RUN chown -R importer.importer /usr/local/nmon-importer &&\
#    chown importer.importer /home/importer/.nmon2influxdb.cfg &&\
#    apt-get update -y && apt-get install -y python3 python3-pip && pip3 install influxdb
CMD ["influxd"]
