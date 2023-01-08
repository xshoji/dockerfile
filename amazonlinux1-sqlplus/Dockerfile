# Base image
FROM xshoji/amazonlinux1-aimless:0.1

RUN yum install -y libaio

RUN curl -o /tmp/basic.rpm https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm \
    && curl -o /tmp/sqlplus.rpm https://download.oracle.com/otn_software/linux/instantclient/19600/oracle-instantclient19.6-sqlplus-19.6.0.0.0-1.x86_64.rpm \
    && rpm -ivh /tmp/basic.rpm \
    && rpm -ivh /tmp/sqlplus.rpm \
    && echo "/usr/lib/oracle/19.6/client64/lib" >> /etc/ld.so.conf.d/oracle.conf \
    && ldconfig \
    && rm -rf /tmp/*.rpm \
;

CMD ["/bin/bash"]
