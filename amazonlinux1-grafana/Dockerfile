# Base image
FROM xshoji/amazonlinux1-aimless:0.1

# Installing on RPM-based Linux ｜ Grafana Documentation
# http://docs.grafana.org/installation/rpm/
ADD ./amazonlinux1-grafana/grafana.repo /etc/yum.repos.d/grafana.repo

RUN yum install wget grafana java-1.8.0-openjdk -y

# Prometheusをインストールして、サーバのメトリクスを取得してみる - Fire Engine
# https://blog.tsurubee.tech/entry/2018/03/14/082536
RUN mkdir /usr/local/src/prometheus \
    && cd /usr/local/src/prometheus \
    && curl -OL https://github.com/prometheus/prometheus/releases/download/v2.2.0/prometheus-2.2.0.linux-amd64.tar.gz \
    && tar zxvf prometheus-2.2.0.linux-amd64.tar.gz \
    && rm prometheus-2.2.0.linux-amd64.tar.gz \
;

ADD ./amazonlinux1-grafana/prometheus.yml /usr/local/src/prometheus/prometheus-2.2.0.linux-amd64/prometheus.yml

RUN curl -OL https://bootstrap.pypa.io/pip/2.7/get-pip.py \
    && python get-pip.py \
    && pip install supervisor \
    && mkdir -p /var/log/supervisor \
    && rm get-pip.py \
;

ADD ./amazonlinux1-grafana/supervisord.conf /etc/supervisord.conf

COPY ./commonfiles/bashrc /root/.bashrc

ENTRYPOINT ["/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf"]
