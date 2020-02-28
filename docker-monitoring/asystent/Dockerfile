FROM centos:latest
LABEL author="CRC Team"
LABEL description="Kontener zasilający bazę danych Monitor - cwiczenie 10"
COPY scripts/* /usr/local/bin/
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm && yum -y update &&\
    yum install -y python36u python36u-libs python36u-devel python36u-pip &&\
    pip3.6 install --upgrade pip && pip3.6 install influxdb
CMD /usr/local/bin/asystent-dane.py
