# Base image
FROM nsgeorge/amazonlinux:0.1

# add epel repository
# @see 外部yumリポジトリの利用 - Qiita https://qiita.com/wwwaltz/items/deb55ccf546761994ef5
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# install php, apache
RUN yum install -y \
    php71 \
    apache2.4 \
;

# install supervisor
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && pip install supervisor \
    && mkdir -p /var/log/supervisor \
;
ADD ./supervisord.conf /etc/supervisord.conf

EXPOSE 22 80

ENTRYPOINT ["/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf"]
