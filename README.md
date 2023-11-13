
# About

My private dockerfiles.

# docker-compose memo

```
# Create container and run
docker-compose up -d
# Create container and run with rebuild
docker-compose up -d --build

# Delete container
docker-compose down

# Stop container
docker-compose stop
```

# docker command memo
### Build, Run and enter the container

```
IMAGE_NAME="nshoji/image_name:0.1"; CONTAINER="test-container1"; docker build . --progress=plain --no-cache -t ${IMAGE_NAME}; docker rm -f ${CONTAINER}; docker run --name ${CONTAINER} -it -d -p 18080:8888 ${IMAGE_NAME}; docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it ${CONTAINER} /bin/bash
```

### Bind directory

```
docker run -id --name ${container_name} -p 8888:8080 -v /local/dir/path:/container/dir/path ${docker_image}:${image_version} /bin/bash
```

### Enter a container

```
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it ${container_name} /bin/bash
```


### Copy file to host from container

```
# Copying files from container to local
docker cp ${container_name}:${container_file_path} ${local_file_path}
docker cp apache_php7:/tmp/file.txt ./file.txt 

# Copying files from container to local
docker cp ${local_file_path} ${container_name}:${container_file_path} 
docker cp file.txt apache_php7:/tmp/file.txt
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

### Show docker Dockerfile history

```
docker history ${docker_image}:${image_version} --no-trunc --format '{{ json .CreatedBy }}'
```

# Useful function

```
# docker exec to container in current directory.
function docker-compose-exec-current() {
  local container_num="${1}"
  [[ ${container_num} == "" ]] && { container_num="1"; }
  local CONTAINER_NAME=$(docker ps --filter name=${PWD##*/} --format "table {{.Names}}" |grep -v "NAMES" |head -n ${container_num} |tail -n 1)
  [[ "${CONTAINER_NAME}" == "" ]] && { echo "CONTAINER_NAME was not found."; return; }
  echo ">> docker-compose exec to ${CONTAINER_NAME} ..."
  docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it ${CONTAINER_NAME} /bin/bash
}

# docker-compose down -> up -> exec to container in current directory.
function docker-compose-rebuild-exec() {
  echo ">> docker-compose down ..."
  docker-compose down
  echo ">> docker-compose up -d --build ..."
  docker-compose up -d --build
  docker-compose-exec-current
}

# docker-compose down -> remove image in current directory.
function docker-remove-image() {
  local IMAGE_ID=$(docker images |grep ${PWD##*/} |awk '{ print $3 }')
  [[ ${IMAGE_ID} == "" ]] && { echo "IMAGE was not found."; return; }
  echo ">> docker-compose down ..."
  docker-compose down
  echo ">> docker rmi ${IMAGE_ID} ..."
  docker rmi -f ${IMAGE_ID}
}
```
