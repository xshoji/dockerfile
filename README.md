
# About

My private dockerfiles.

# Memo

### Create container and enter the container

```
docker exec --name ${container_name} -it ${container_image_name}:${version} /bin/bash
docker exec --name test -it mywebapp_java:0.1 /bin/bash
```

Bind directory

```
docker run -id --name gab1.1 -p 8888:8080 -v .:/opt/gab -v /opt/gab/node_modules gab:1.1 /bin/bash
```

### Enter a container

```
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it ${container_name} /bin/bash
```

### Create container by docker-compose

Build and run as a daemon

```
docker-compose up -d --build
```

Delete containers

```
docker-compose down -d
```

Stop containers

```
docker-compose stop
```

### Copy file to host from container

```
docker cp ${container_name}:${container_file_path} ${host_file_path}
docker cp apache_php7:/etc/supervisord.conf .
```

### Check container logs

```
docker logs ${container_hash_value}
docker logs 447c7a7db9db
```


### Delete container

```
docker rm -f ${container_name | container_hash_value}
```

### Delete image

```
docker rmi -f ${image_hash_value}
```
