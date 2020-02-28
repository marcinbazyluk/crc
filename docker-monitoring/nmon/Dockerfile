FROM centos:latest
LABEL author="CRC Team"
LABEL description="nmon Nigel Griffiths"
COPY bin/* /usr/local/bin/
RUN mkdir /njmon &&\
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm && yum -y update &&\
    yum install -y python36u python36u-libs python36u-devel python36u-pip &&\
    pip3.6 install --upgrade pip && pip3.6 install influxdb
CMD /usr/local/bin/njmon_collector -p 8181 -d /njmon-files -i -X crc2019
