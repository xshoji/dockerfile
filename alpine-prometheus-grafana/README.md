
# Prometheus

http://localhost:19090/graph

# Grafana

http://localhost:13000/login

 - user: admin
 - pass: admin
 
# Java app

```
$ docker cp webapi/target/spring-boot-prometheus-webapi-0.0.1-SNAPSHOT.jar amazonlinux-grafana:/tmp/
$ docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it amazonlinux-grafana /bin/bash
$ java -jar /tmp/spring-boot-prometheus-webapi-0.0.1-SNAPSHOT.jar
```

# Java app

```
// from host
$ curl -s -H "Content-Type: text/plain" localhost:18080/prometheus
```


# reference

> Spring Boot ✕ Prometheus ✕ Grafana でアプリケーションのモニタリング - Qiita  
> https://qiita.com/AHA_oretama/items/984f8f63ac95a7192174

> Prometheusをインストールして、サーバのメトリクスを取得してみる - Fire Engine  
> https://blog.tsurubee.tech/entry/2018/03/14/082536
