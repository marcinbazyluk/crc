FROM centos:latest
LABEL author="CRC Team"
LABEL description="NMON Importer Server"
RUN mkdir -p /share &&\
    mkdir -p /usr/local/nmon-import/{bin,db,logs,}

COPY bin/nmon2influxdb /usr/bin/nmon2influxdb
COPY bin/nmon_importer /usr/local/nmon-import/bin
COPY bin/nmon_import_slack.py /usr/local/nmon-import/bin
COPY config/.nmon2influxdb.cfg /root/
COPY config/root-importer.cron /var/spool/cron/root
COPY config/lab.lst /usr/local/nmon-import/lab.lst

RUN yum install -y cronie &&\
    chown root.root /root/.nmon2influxdb.cfg &&\
    chown root.root /var/spool/cron/root &&\
    chown root.root /usr/bin/nmon2influxdb &&\
    chmod u+x /usr/bin/nmon2influxdb &&\
    chown root.root /usr/local/nmon-import/lab.lst

CMD /usr/sbin/crond -n
