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


# ORA

## ORA-28002: the password will expire within 7 days

> ぼちぼちやります。： ORA-28002 が出たら  
> http://bochi.vyw.jp/2014/07/ora-28002.html

```
sqlplus system/oracle@xe
alter profile default limit password_life_time unlimited;
alter user system identified by oracle;
```

# Query


```
-- 日付のフォーマット指定
to_date('20171001 00:00:00', 'YYYYMMDD HH24:MI:SS')
to_char(updated_on, 'YYYY-MM-DD HH24:MI:SS')

-- 昨日の16:00
SELECT TRUNC(SYSDATE - 1 ) + 16/24 FROM dual;

-- 今日の15:59:59
SELECT TRUNC(SYSDATE) + 16/24 - 1/86400 FROM dual;

-- テーブルのインデックスを確認
SELECT table_name, index_name, column_position, column_name FROM user_ind_columns WHERE table_name = 'TABLE_NAME' ORDER BY table_name, index_name, column_position;

-- インデックスを指定して確認
SELECT OWNER || CHR(9) || INDEX_NAME || CHR(9) || INDEX_TYPE || CHR(9) || TABLE_NAME FROM DBA_INDEXES WHERE OWNER = 'SCHEMA_NAME' AND INDEX_NAME = 'IDX_NAME';

-- シーケンス確認
select sequence_name || CHR(9) || last_number from dba_sequences order by sequence_name;
select sequence_name, increment_by, min_value, cache_size, last_number from user_sequences where sequence_name = 'SEQ_NAME';

-- テーブル一覧
SELECT TABLE_NAME FROM DBA_TABLES WHERE OWNER='SCHEMA_NAME' AND TABLE_NAME LIKE '%AAA%';

-- カラム一覧
SELECT OWNER || CHR(9) || TABLE_NAME || CHR(9) || COLUMN_NAME || CHR(9) || DATA_TYPE || CHR(9) || DATA_LENGTH FROM DBA_TAB_COLUMNS WHERE OWNER = 'SCHEMA_NAME' AND TABLE_NAME = 'TABLE_NAME';

-- SCHEMA_NAMEのテーブルへシノニムを張っている人
SELECT OWNER ||CHR(9)||  TABLE_OWNER ||CHR(9)|| SYNONYM_NAME ||CHR(9)|| TABLE_NAME ||CHR(9)|| DB_LINK  FROM DBA_SYNONYMS WHERE TABLE_OWNER = 'SCHEMA_NAME' ORDER BY OWNER;

-- SCHEMA_NAMEがどのテーブルへシノニムを張っているか
SELECT OWNER ||CHR(9)||  TABLE_OWNER ||CHR(9)|| SYNONYM_NAME ||CHR(9)|| TABLE_NAME ||CHR(9)|| DB_LINK  FROM DBA_SYNONYMS WHERE OWNER = 'SCHEMA_NAME' ORDER BY TABLE_OWNER;

-- クエリの実行時間測る
SQL> set timing on;
SQL> select xxxx
...
経過: 00:00:00.84
SQL> set timing off;

-- 一括Insertする
INSERT ALL
INTO tbl_hoge (id, name, age) VALUES (1, 'Michael', 55)
INTO tbl_hoge (id, name, age) VALUES (2, 'Christopher', 77)
SELECT * FROM DUAL;
```
