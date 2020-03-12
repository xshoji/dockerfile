# Integration of oraql script

## What is oraql?

"oraql" is helper script for sqlplus.

> toolbox/bashscript/oraql at master · xshoji/toolbox  
> https://github.com/xshoji/toolbox/tree/master/bashscript/oraql

## How to run?

```
// build container
docker-compose up -d

// copy script
docker cp oraql.sh oraclexe11g:/tmp/

// docker exec
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it oraclexe11g /bin/bash

// run script
cd /tmp
export DBUSER=system; export DBPASS=oracle; export DBSID=xe; export DBSCHEMA=system
./oraql.sh -q "SELECT D_OBJ#, D_TIMESTAMP FROM SYS.DEPENDENCY\$ LIMIT 5;"
```

## Samples

```
// count all table on SYS schema, and sort by count, and list up top 100 table.
./oraql.sh -q "SELECT TABLE_NAME FROM DBA_TABLES WHERE OWNER = 'SYS';" -n |xargs -I{} ./oraql.sh -q "SELECT '{}', COUNT(1) FROM SYS.{};" -n |awk '{print $2"  "$1}' |sort -n -r |head -n 100 > /tmp/result.txt

// select sample
./oraql.sh -q "SELECT D_OBJ#, D_TIMESTAMP, ORDER#, P_OBJ#, D_OWNER#, PROPERTY, D_ATTRS, D_REASON FROM SYS.DEPENDENCY\$ LIMIT 50;"

// innerjoin
./oraql.sh -q "SELECT a.D_OBJ#, a.D_TIMESTAMP, a.ORDER#, a.P_OBJ#, a.D_OWNER#, a.PROPERTY, a.D_ATTRS, a.D_REASON FROM SYS.DEPENDENCY\$ a inner join (SELECT D_OBJ#, D_TIMESTAMP, ORDER#, P_OBJ#, D_OWNER#, PROPERTY, D_ATTRS, D_REASON FROM SYS.DEPENDENCY\$ WHERE PROPERTY = 1) tmp ON a.D_OBJ# = tmp.D_OBJ# LIMIT 50;"

// select sample where in strings
./oraql.sh -q "SELECT '' || D_OBJ# FROM SYS.DEPENDENCY\$ LIMIT 2000;" -r |sort |uniq > /tmp/wherein.txt

// show select columns
./oraql.sh -q "DESC SYS.ARGUMENT$;" |sed "/^$/d" |tail -n +6 |awk '{ print $1 }' |awk '{if(1){ORS=", "};print;}'
```
