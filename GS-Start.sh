#!/bin/bash

# Define paths to your applications
ZOOKEEPER_PATH=/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/ZooKeeperKafka_8.14.2/zookeeper-3.4.12

KAFKA_PATH=/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/ZooKeeperKafka_8.14.2/kafka_2.11-2.3.1

ACTIVEMQ_PATH=/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/apache-activemq-55-v1

# TOMCAT_PATH=/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/apache_tomcat_8.5.65/bin


# Function to start a service in a new terminal
start_service_in_terminal() {
    local service_name=$1
    local service_path=$2

    echo "Starting ${service_name} in a new terminal..."
    gnome-terminal --tab --title="${service_name}" -- bash -c "${service_path}; exec bash"
}

# Start each service in a new terminal with a delay of 5 seconds between each
start_service_in_terminal "Zookeeper" "${ZOOKEEPER_PATH}/bin/zkServer.sh start"
sleep 5
start_service_in_terminal "Kafka" "${KAFKA_PATH}/bin/kafka-server-start.sh ${KAFKA_PATH}/config/server.properties"
sleep 5
start_service_in_terminal "ActiveMQ" "${ACTIVEMQ_PATH}/bin/./activemq console"
# sleep 15
# start_service_in_terminal "Tomcat" "${TOMCAT_PATH}/catalina.sh run"

echo "All services started in separate terminals."

sleep 10

#!/bin/bash

# Define the path to Tomcat bin directory
TOMCAT_BIN_DIR="/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/apache_tomcat_8.5.65/bin"

# Change directory to Tomcat bin directory
cd "$TOMCAT_BIN_DIR" || exit

# Start Tomcat
./catalina.sh run
