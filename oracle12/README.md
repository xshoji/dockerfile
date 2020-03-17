# Oracle Database Enterprise Edition

> Oracle Database Enterprise Edition - Docker Hub  
> https://hub.docker.com/_/oracle-database-enterprise-edition

## How to up?

mac上にて

```
$ docker login
nsgeorge
password
```

でログインする。

```
// imageをpullする
$ docker pull store/oracle/database-enterprise:12.1.0.2

// コンテナを立ち上げる
docker-compose up -d
```

コンテナが起動してからデータベースのセットアップ、sqlplusのセットアップとかが走るからしばらく待つ（これ重要）

```
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS                             PORTS                                            NAMES
18759e7a95fd        store/oracle/database-enterprise:12.2.0.1   "/bin/sh -c '/bin/ba…"   16 seconds ago      Up 15 seconds (health: starting)   0.0.0.0:1521->1521/tcp, 0.0.0.0:5500->5500/tcp   oracle12_o_1
↓
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS                   PORTS                                            NAMES
18759e7a95fd        store/oracle/database-enterprise:12.2.0.1   "/bin/sh -c '/bin/ba…"   6 minutes ago       Up 6 minutes (healthy)   0.0.0.0:1521->1521/tcp, 0.0.0.0:5500->5500/tcp   oracle12_o_1
```

になったらOKっぽい。これ数分かかる。OKになったらsqlplus用コンテナに入って接続する。

```
// sqlplus用コンテナ oracle12_s_1 に入る
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it oracle12_s_1 /bin/bash

// sqlplusでログイン（ 192.168.240.3 は oracle12_o_1 側で hostname -i で確認 ）
$ sqlplus sys/Oradoc_db1@//192.168.240.3:1521/orclpdb1.localdomain as sysdba

SQL*Plus: Release 19.0.0.0.0 - Production on Wed Mar 18 00:46:07 2020
Version 19.6.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Connected to:
Oracle Database 12c Enterprise Edition Release 12.2.0.1.0 - 64bit Production

SQL> exit
```

> SQLPlusでOracleにリモート接続するメモ - Qiita  
> https://qiita.com/kure/items/24ec62839ffc966edba2

> DOCKER で ORACLE DATABASE 12C を起動して PDB に接続するまで - Qiita  
> https://qiita.com/KenjiOtsuka/items/97517fdd3406627cf8a7

---

> DockerでOracle環境構築｜Mr.Collins｜note  
> https://note.com/mr_collins/n/n3535bc08dbb2

ここで環境変数でパスワードとか変えれるっぽいけど、うまく変えれなかった。

> docker-images/OracleDatabase/SingleInstance at master · oracle/docker-images  
> https://github.com/oracle/docker-images/tree/master/OracleDatabase/SingleInstance


## Edit .bashrc

```
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it oracle12_o_1 /bin/bash -c "echo \"PS1='[\u@$(echo \\\${COMPOSE_PROJECT_NAME}) \\\$PWD]\$ '\" >> ~/.bashrc"
```

## Oraql

```
// oracle12_s_1
export DBUSER=sys; export DBPASS=Oradoc_db1; export DBSID="//192.168.240.3:1521/orclpdb1.localdomain as sysdba"; export DBSCHEMA=sys

// table recourd count
./oraql.sh -q "show tables" -r |sort |sed "s/\t/./g" |xargs -I{} ./oraql.sh -q "select '{}', count(1) from {}" -r |awk '{ print $2"\t"$1 }' |sort -n -r
```
