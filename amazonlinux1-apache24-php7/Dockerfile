# Base image
FROM xshoji/amazonlinux1-aimless:0.1

# add epel repository
# @see 外部yumリポジトリの利用 - Qiita https://qiita.com/wwwaltz/items/deb55ccf546761994ef5
RUN rpm -ivh https://archives.fedoraproject.org/pub/archive/epel/6/x86_64/epel-release-6-8.noarch.rpm

# install php, apache
RUN yum install -y \
    php71 \
    apache2.4 \
;

# install supervisor
RUN curl -OL https://bootstrap.pypa.io/pip/2.7/get-pip.py \
    && python get-pip.py \
    && pip install supervisor \
    && mkdir -p /var/log/supervisor \
;
ADD ./amazonlinux1-apache24-php7/supervisord.conf /etc/supervisord.conf

COPY ./commonfiles/bashrc /root/.bashrc

EXPOSE 22 80

ENTRYPOINT ["/usr/local/bin/supervisord", "-c", "/etc/supervisord.conf"]
