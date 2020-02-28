FROM prom/prometheus:latest
LABEL author="CRC Team"
LABEL description="Prometheus server image"
COPY conf/* /etc/prometheus/
COPY repo/prometheus.repo /etc/yum.repos.d/
