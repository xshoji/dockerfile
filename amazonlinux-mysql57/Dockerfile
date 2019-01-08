# Base image
FROM nsgeorge/amazonlinux:0.1

# update yum
RUN yum -y install http://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm \
   && yum -y install mysql-community-server \
   && chkconfig mysqld on \
# - ["/etc/sysconfig/network： No such file or directory" - Qiita](https://qiita.com/mats116/items/59615a169a45884c2548)
   && echo "NETWORKING=yes" > /etc/sysconfig/network \
# - [MySQL 5.7でrootユーザのパスワードを再設定 - Qiita](https://qiita.com/ksugawara61/items/d8d69b7d57a3afcef980)
   && echo "skip-grant-tables" >> /etc/my.cnf \
;

ENTRYPOINT /etc/init.d/mysqld start && /bin/bash
