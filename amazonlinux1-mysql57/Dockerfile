# Base image
FROM xshoji/amazonlinux1-aimless:0.1

# update yum
RUN yum clean all \
   && yum -y install https://dev.mysql.com/get/mysql57-community-release-el6-7.noarch.rpm \
   # ［MySQL］ アップデート時にGPGキーのエラーで停止してしまう場合 https://blog.katsubemakito.net/mysql/mysql-update-error-gpg
   && rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 \
   && yum -y install mysql-community-server \
   && chkconfig mysqld on \
   # "/etc/sysconfig/network: No such file or directory" - Qiita https://qiita.com/mats16/items/59615a169a45884c2548
   && echo "NETWORKING=yes" > /etc/sysconfig/network \
   # MySQL 5.7でrootユーザのパスワードを再設定 - Qiita https://qiita.com/ksugawara61/items/d8d69b7d57a3afcef980
   && echo "skip-grant-tables" >> /etc/my.cnf \
;

COPY ./commonfiles/bashrc /root/.bashrc

ENTRYPOINT /etc/init.d/mysqld start && /bin/bash
