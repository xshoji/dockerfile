


# 最初に

mac上にて

```
$ docker login
nsgeorge
password
```

でログインする。

```
$ docker pull store/oracle/database-enterprise:12.1.0.2
```

で`docker-composer up -d`。

コンテナが起動してからデータベースのセットアップ、Sqlplusのセットアップとかが走るからしばらく待つ（これ重要）

```
# tailf /home/oracle/setup/log/setupDB.log
```

これ数分かかる。もしかするとポートの指定がおかしいのかも。フォワードせずにやってみる。

```
// Login?
# /u01/app/oracle/product/12.1.0/dbhome_1/bin/sqlplus sys@OraDoc
```

結果、うまく行かなかった。docker sotreでコメント済み。

 - [Oracle Database Enterprise Edition - Docker Store](https://store.docker.com/images/oracle-database-enterprise-edition?tab=reviews)



# Dcoer Storeのダウンロード画面より

Oracle Database Enterprise Edition | Thu May 25 2017
Copy and paste to pull this image

docker pull store/oracle/database-enterprise:12.1.0.2

## Environment file

To create a database container, use the environment file below to pass configuration parameters into container. The example environment file is:

```unix
####################################################################
## Copyright(c) Oracle Corporation 1998,2016. All rights reserved.##
##                                                                ##
##                   Docker OL7 db12c dat file                    ##
##                                                                ##
####################################################################

##------------------------------------------------------------------
## Specify the basic DB parameters
##------------------------------------------------------------------

## db sid (name)
## default : ORCL
## cannot be longer than 8 characters

DB_SID=OraDoc

## db passwd
## default : Oracle

DB_PASSWD=MyPasswd123

## db domain
## default : localdomain

DB_DOMAIN=my.domain.com

## db bundle
## default : basic
## valid : basic / high / extreme
## (high and extreme are only available for enterprise edition)

DB_BUNDLE=basic

## end
```

## create command

Database name, password, domain and feature bundle can be customized using the environment file. The command for creating a database container is:

```unix
$ docker run -d --env-file <path_to_env_file> -p <listener_port>:1521 -p <http_port>:5500 -it --name <container_name> --shm-size="<shared_memory_size>" <image_name>
```

Parameters:
   <path_to_env_file> is the path to the environment file you created using above example.
   <listener_port> is the port on host machine to map the container's 1521 port (listener port).
   <http_port> is the port on host machine to map the container's 5500 port (http service port).
   <container_name> is the container name you want to create.
   <shared_memory_size> is the memory size for the container to run. The minimum requirement is 4GB (--shm-size="4g").
   <image_name> is the image that you use to create a container.

For example, if you save your parameters in db_env.dat file and want to use host port 1527 and port 5507 for this container, run:

```unix
$ docker run -d --env-file ./db_env.dat -p 1527:1521 -p 5507:5500 -it --name dockerDB --shm-size="8g" store/oracle/database-enterprise:12.1.0.2
```

The database setup and startup are executed by running "/bin/bash /home/oracle/setup/dockerInit.sh", which is the default CMD instruction in the images. If you want to customize the entry point of container, remember to put this command at the end. The dockerInit.sh shell script will end into a loop to keep container running. If you stop and start/restart the container, the command will automatically startup the database.

## Accessing container

To enter the container and run commands, use docker exec:

$ docker exec -it <container_name> /bin/bash
Where <container_name> is the container name you want to get into. Once you are in, you are running as root user. Use "su - oracle" to run as oracle user. To exit of container, use "exit" just like a regular ssh connection.

## database setup log

The first database setup takes about 5 to 8 minutes. Logs are kept under /home/oracle/setup/log.

To check whether the database setup is successful, check the log file "/home/oracle/setup/log/setupDB.log". If "Done ! The database is ready for use ." is shown, the database setup was successful.

The restart of container takes less than 1 minute just to start the database and its listener. The startup log is "/home/oracle/setup/log/startupDB.log"

EXPLORE
Docker Editions
Containers
Plugins
ACCOUNT
My Content
Billing
PUBLISH
Publisher Center
SUPPORT
Feedback
Documentation
SOCIAL
Copyright © 2017 Docker Inc. All rights reserved.
HubCloudLegalHomeSwag
