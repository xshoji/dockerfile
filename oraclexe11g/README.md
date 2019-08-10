# Instllation

 - [wnameless/oracle-xe-11g - Docker Hub](https://hub.docker.com/r/wnameless/oracle-xe-11g/)

```
$ docker-compose up -d
$ docker exec -it oraclexe11g /bin/bash
# sqlplus system/oracle@xe
SQL>
```

 - user: system
 - pass: oracle
 - sid: xe
 - schema: system

# いろいろ設定を追加

```
# apt-get install -y vim curl less
```

 - [Installion: How To Install rlwrap On Ubuntu 15.04](http://installion.co.uk/ubuntu/vivid/universe/r/rlwrap/install/index.html)

```
# vim /etc/apt/sources.list

...
deb http://us.archive.ubuntu.com/ubuntu vivid main universe
...

# apt-get update
# apt-get install -y rlwrap
```

 - [SQL*Plusがクソだったから | SOTA](http://deeeet.com/writing/2013/11/06/rlwrap/)

```
# echo 'alias sqlplus="rlwrap /u01/app/oracle/product/11.2.0/xe/bin/sqlplus"' >> ~/.bashrc
# sqlplus system/oracle@xe
// passwordの変更
# ALTER USER system IDENTIFIED BY "oracle2";
```

# knowledge

## sqlpulsを少しでも見やすく

```
SQL> set pagesize 0;
SQL> set heading off;
```

## Query

**全テーブルを出す**

```sql
DESC all_tables;
SELECT OWNER || CHR(9) || TABLE_NAME FROM ALL_TABLES ORDER BY OWNER, TABLE_NAME;
```

**テーブル一覧を出す**

```sql
SELECT * FROM USER_TABLES WHERE TABLE_NAME LIKE '%package%' ORDER BY TABLE_NAME
```

**カラム一覧（sqlplus限定）**

```sql
DESC "package";
```

**カラム一覧（SQLで）**

Oracleの各種一覧を取得するSQL - Random Note
http://d.hatena.ne.jp/hisaboh/20080331/p1

```sql
SQL> 
SELECT OWNER || CHR(9) || TABLE_NAME || CHR(9) || COLUMN_NAME || CHR(9) || DATA_TYPE || CHR(9) || DATA_LENGTH FROM DBA_TAB_COLUMNS WHERE OWNER = 'OWNER' AND TABLE_NAME = 'TABLE';
```

**テーブルを消す**

```sql
DROP TABLE "package";
```

 - ""を忘れずに
 - IF EXISTS的なことはできないらしい。まじか・・・



## Type

 - varcharは4000が最大
 - PRYMARY KEYは当該キーのとなりで宣言

