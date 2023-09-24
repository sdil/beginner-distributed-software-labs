apt-get install openjdk-21-jdk wget
wget https://dlcdn.apache.org/kafka/3.5.0/kafka_2.13-3.5.0.tgz

tar -xzf kafka_2.13-3.5.0.tgz
cd kafka_2.13-3.5.0

KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"
./bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties

# update node id
# update server quorum

JMX_PORT=7001 ./bin/kafka-server-start.sh config/kraft/server.properties
