# kafka-docker

```
$ git clone https://github.com/wurstmeister/kafka-docker
$ cp docker-compose.yml.dist kafka-docker/docker-compose.yml
$ cd kafka-docker
$ docker-compose up -d
```

## Tips

```
// 3台でスケールアウトする（トピックのレプリケーションファクターを１以上に指定するならここを1以上にscaleする必要あり）
docker-compose down && docker-compose up -d && docker-compose scale kafka=3

// topic生成
/opt/kafka/bin/kafka-topics.sh --create --topic topic1 --partitions 4 --replication-factor 1 --zookeeper zookeeper:2181

// topic確認 
/opt/kafka/bin/kafka-topics.sh --describe --topic topic1 --zookeeper zookeeper:2181

// consumerの確認
/opt/kafka/bin/kafka-console-consumer.sh --topic=topic1 --zookeeper=zookeeper:2181
```

## References

> BLOG.IK.AM - Spring Cloud Streamでマイクロサービス間メッセージング  
> https://blog.ik.am/entries/369

> wurstmeister/kafka-docker： Dockerfile for Apache Kafka  
> https://github.com/wurstmeister/kafka-docker

> edenhill/kafkacat： Generic command line non-JVM Apache Kafka producer and consumer  
> https://github.com/edenhill/kafkacat

> kafka-docker でローカルに kafka クラスタを構築する - Qiita  
> https://qiita.com/corhhey/items/fa254fa64cf88ab5f588