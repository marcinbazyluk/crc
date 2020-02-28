FROM prom/alertmanager:latest
LABEL author="CRC Team"
LABEL description="Alert manager from prometheus"
COPY conf/*.yml /etc/alertmanager/
COPY conf/*.tmpl /alertmanager/
