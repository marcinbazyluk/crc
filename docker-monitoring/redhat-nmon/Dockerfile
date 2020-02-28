FROM centos:latest
LABEL author="CRC TEAM"
LABEL description="Minimal CentOS installation with nmon tool installed"
COPY bin/njmon /bin/
CMD njmon -s 60 -i vm-njmon -p 8181 -X crc2019
