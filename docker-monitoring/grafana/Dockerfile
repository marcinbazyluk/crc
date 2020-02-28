FROM grafana/grafana:5.4.3
LABEL author="CRC Team"
LABEL description="Grafana dashboard server"
EXPOSE 3000
ADD provisioning /etc/grafana/provisioning
ADD conf/grafana.ini /etc/grafana/grafana.ini
#ADD dashboards /var/lib/grafana/dashboards
#ADD initialize/entrypoint/ /var/lib/grafana/custom
