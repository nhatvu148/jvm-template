#!/bin/bash

# Start Zookeeper
zookeeper-server-start.sh /opt/kafka_2.13-3.6.1/config/zookeeper.properties &

# Start Kafka
kafka-server-start.sh /opt/kafka_2.13-3.6.1/config/server.properties &