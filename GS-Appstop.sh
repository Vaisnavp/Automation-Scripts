#!/bin/bash

# Define paths to your applications
ZOOKEEPER_PATH=/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/ZooKeeperKafka_8.14.2/zookeeper-3.4.12
KAFKA_PATH=/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/ZooKeeperKafka_8.14.2/kafka_2.11-2.3.1
ACTIVEMQ_PATH=/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/apache-activemq-55-v1
TOMCAT_PATH=/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/apache_tomcat_8.5.65/bin

# Function to stop a service in a new terminal
stop_service_in_terminal() {
    local service_name=$1
    local service_path=$2

    echo "Stopping ${service_name} in a new terminal..."
    gnome-terminal --tab --title="Stop ${service_name}" -- bash -c "${service_path}; sleep 5; exec bash"
}

# Stop each service in a new terminal
stop_service_in_terminal "Tomcat" "${TOMCAT_PATH}/shutdown.sh"
stop_service_in_terminal "ActiveMQ" "${ACTIVEMQ_PATH}/bin/activemq stop"

# Stop Kafka
echo "Stopping Kafka in a new terminal..."
stop_service_in_terminal "Kafka" "${KAFKA_PATH}/bin/kafka-server-stop.sh ${KAFKA_PATH}/config/server.properties"
stop_service_in_terminal "Zookeeper" "${ZOOKEEPER_PATH}/bin/zkServer.sh stop"

echo "All services stopped in separate terminals."
