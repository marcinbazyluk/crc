FROM graphiteapp/docker-graphite-statsd
LABEL author="CRC Team"
LABEL description="graphite"
ADD conf/local_settings.py /opt/defaultconf/graphite/local_settings.py
ADD conf/local_settings.py /opt/graphite/webapp/graphite/local_settings.py
ADD conf/storage-aggregation.conf /opt/graphite/conf/storage-aggregation.conf
ADD conf/storage-schemas.conf /opt/graphite/conf/storage-schemas.conf
