# Base image
FROM xshoji/amazonlinux2-aimless:0.1

# update yum
RUN yum clean all \
   && yum -y install https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm \
   # ［MySQL］ アップデート時にGPGキーのエラーで停止してしまう場合 https://blog.katsubemakito.net/mysql/mysql-update-error-gpg
   && rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 \
   && yum -y install --enablerepo=mysql80-community mysql-community-server \
   && chkconfig mysqld on \
   # "/etc/sysconfig/network: No such file or directory" - Qiita https://qiita.com/mats16/items/59615a169a45884c2548
   && echo "NETWORKING=yes" > /etc/sysconfig/network \
   # MySQL 5.7でrootユーザのパスワードを再設定 - Qiita https://qiita.com/ksugawara61/items/d8d69b7d57a3afcef980
   && echo "skip-grant-tables" >> /etc/my.cnf \
   # Fatal error: Please read "Security" section of the manual to find out how to run mysqld as root!
   # WSL2でMySQLを起動するときは mysqld --daemonize を使う - そーだいなるらくがき帳 https://soudai.hatenablog.com/entry/2021/09/12/170317
   && echo -e "# The MySQL server\n[mysqld]\nuser = mysql" >> /etc/my.cnf \
;

COPY ./commonfiles/bashrc /root/.bashrc

# M1 Docker - Failed to get D-Bus connection: No such file or directory
# https://zenn.dev/hashi8084/articles/fdbdb40c50f185

#ENTRYPOINT mysqld start && /bin/bash
ENTRYPOINT /sbin/init
