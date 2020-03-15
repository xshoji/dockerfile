# Base image
FROM alpine:3.7

RUN apk update \
  && apk upgrade \
  && apk add bash curl less vim \
;

RUN mkdir -p /usr/local/src/prometheus \
  && cd /usr/local/src/prometheus \
  && curl -L https://github.com/prometheus/prometheus/releases/download/v2.2.0/prometheus-2.2.0.linux-amd64.tar.gz -o prometheus-2.2.0.linux-amd64.tar.gz \
  && tar zxvf prometheus-2.2.0.linux-amd64.tar.gz \
  && rm prometheus-2.2.0.linux-amd64.tar.gz \
;
ADD ./alpine-prometheus-grafana/prometheus/prometheus.yml /usr/local/src/prometheus/prometheus-2.2.0.linux-amd64/prometheus.yml

COPY ./commonfiles/bashrc /root/.bashrc

# ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/usr/local/src/prometheus/prometheus-2.2.0.linux-amd64/prometheus", "--config.file=/usr/local/src/prometheus/prometheus-2.2.0.linux-amd64/prometheus.yml"]
