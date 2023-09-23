sudo apt-get install openjdk-21-jdk

wget https://dlcdn.apache.org/zookeeper/zookeeper-3.9.0/apache-zookeeper-3.9.0-bin.tar.gz
tar -xvf apache-zookeeper-3.9.0-bin

cd apache-zookeeper-3.9.0-bin
echo >> EOF
tickTime=2000
dataDir=/var/lib/zookeeper
clientPort=2181
initLimit=5
syncLimit=2
server.1=zoo1:2888:3888 # Update the zookeepers hostname 
server.2=zoo2:2888:3888 # Update the zookeepers hostname
server.3=zoo3:2888:3888 # Update the zookeepers hostname
EOF > conf/zoo.cfg


# Update the id for each of the node
sudo echo "1" > /var/lib/zookeeper/myid

./bin/zkServer.sh start-foreground
