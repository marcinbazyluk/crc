FROM centos:latest
LABEL author="CRC Team"
LABEL description="Minimal CentOS installation with several node exporters - prometheus"
COPY repo/prometheus.repo /etc/yum.repos.d/
RUN yum --nogpgcheck -y install node_exporter && rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &&\
    yum -y install stress
COPY config/prometheus_redhat_node.yml /etc/prometheus/prometheus.yml
CMD [ "node_exporter" ]
