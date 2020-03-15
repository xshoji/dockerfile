


# 最初に

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
18759e7a95fd        store/oracle/database-enterprise:12.2.0.1   "/bin/sh -c '/bin/ba…"   16 seconds ago      Up 15 seconds (health: starting)   0.0.0.0:1527->1521/tcp, 0.0.0.0:5507->5500/tcp   oracle12
↓
CONTAINER ID        IMAGE                                       COMMAND                  CREATED             STATUS                   PORTS                                            NAMES
18759e7a95fd        store/oracle/database-enterprise:12.2.0.1   "/bin/sh -c '/bin/ba…"   6 minutes ago       Up 6 minutes (healthy)   0.0.0.0:1527->1521/tcp, 0.0.0.0:5507->5500/tcp   oracle12
```

になったらOKっぽい。これ数分かかる。OKになったら

```
// コンテナに入る
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it oracle12_db_1 /bin/bash

// sqlplusでログイン
$ sqlplus sys/Oradoc_db1@ORCLCDB as sysdba

SQL*Plus: Release 12.2.0.1.0 Production on Sun Mar 15 18:40:19 2020

Copyright (c) 1982, 2016, Oracle.  All rights reserved.

Last Successful login time: Sun Mar 15 2020 18:39:10 +00:00

Connected to:
Oracle Database 12c Enterprise Edition Release 12.2.0.1.0 - 64bit Production

SQL>
```

> DockerでOracle環境構築｜Mr.Collins｜note  
> https://note.com/mr_collins/n/n3535bc08dbb2

ここで環境変数でパスワードとか変えれるっぽいけど、うまく変えれなかった。

> docker-images/OracleDatabase/SingleInstance at master · oracle/docker-images  
> https://github.com/oracle/docker-images/tree/master/OracleDatabase/SingleInstance
