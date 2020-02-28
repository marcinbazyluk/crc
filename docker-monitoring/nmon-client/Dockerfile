FROM centos:latest
LABEL author="CRC Team"
LABEL description="NMON Client"
COPY bin/nmon16h_x86_rhel7 /usr/local/bin/nmon
COPY config/root-client.cron /var/spool/cron/root
RUN mkdir -p /share &&\
    chmod a+x /usr/local/bin/nmon &&\
    chown root.root /var/spool/cron/root &&\
    yum -y install cronie
CMD /usr/sbin/crond -n
