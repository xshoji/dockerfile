# Base image
FROM xshoji/alpine3-aimless:0.1

RUN mkdir -p /usr/local/src/prometheus \
  && cd /usr/local/src/prometheus \
  && curl -OL https://github.com/prometheus/prometheus/releases/download/v2.2.0/prometheus-2.2.0.linux-amd64.tar.gz \
  && tar zxvf prometheus-2.2.0.linux-amd64.tar.gz \
  && rm prometheus-2.2.0.linux-amd64.tar.gz \
;
ADD ./alpine3-prometheus-grafana/prometheus/prometheus.yml /usr/local/src/prometheus/prometheus-2.2.0.linux-amd64/prometheus.yml

ENTRYPOINT ["/usr/local/src/prometheus/prometheus-2.2.0.linux-amd64/prometheus", "--config.file=/usr/local/src/prometheus/prometheus-2.2.0.linux-amd64/prometheus.yml"]
