# Base image
FROM xshoji/amazonlinux:0.1

# > Installing on RPM-based Linux ｜ Grafana Documentation
# > http://docs.grafana.org/installation/rpm/
ADD ./grafana.repo /etc/yum.repos.d/grafana.repo

RUN yum install grafana java-1.8.0-openjdk -y

# > Prometheusをインストールして、サーバのメトリクスを取得してみる - Fire Engine
# > https://blog.tsurubee.tech/entry/2018/03/14/082536
RUN mkdir /usr/local/src/prometheus \
    && cd /usr/local/src/prometheus \
    && wget https://github.com/prometheus/prometheus/releases/download/v2.2.0/prometheus-2.2.0.linux-amd64.tar.gz \
    && tar zxvf prometheus-2.2.0.linux-amd64.tar.gz \
;
ADD ./prometheus.yml /usr/local/src/prometheus/prometheus-2.2.0.linux-amd64/prometheus.yml

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && pip install supervisor \
    && mkdir -p /var/log/supervisor \
;
ADD ./supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf"]
