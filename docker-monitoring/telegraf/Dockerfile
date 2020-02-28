FROM centos:latest
LABEL author="CRC Team"
LABEL description="Minimal CentOS installation with telegraf package onboard"
RUN yum -y update && rpm -ihv https://dl.influxdata.com/telegraf/releases/telegraf-1.10.1-1.x86_64.rpm
CMD ["telegraf"]
