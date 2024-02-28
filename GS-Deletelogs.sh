#!/bin/bash

# Define paths to log directories
ZOOKEEPER_LOG_DIR="/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/ZooKeeperKafka_8.14.2/zookeeper-3.4.12/logs"
KAFKA_LOG_DIR="/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/ZooKeeperKafka_8.14.2/kafka_2.11-2.3.1/logs"
ACTIVEMQ_DATA_LOG_DIR="/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/apache-activemq-55-v1/data"
ACTIVEMQ_TMP_LOG_DIR="/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/apache-activemq-55-v1/tmp"
TOMCAT_LOG_DIR="/home/administrator/GS_Deployment/GS_VolPay_Prod_ACH/apache_tomcat_8.5.65/logs"

# Function to delete logs from a directory
delete_logs() {
    local log_dir=$1

    echo "Deleting logs in ${log_dir}..."
    rm -rf "${log_dir}"/*
}

# Function to delete entries from SQL database
delete_database_entries() {
    local database=$1
    local username=$2
    local password=$3

    echo "Deleting entries from ${database} database..."
    echo "DELETE FROM COMPONENTREGISTRY;" | mysql -u ${C##_GS_PRODSIVER} -p${1234} ${ORCLCDB}
    echo "DELETE FROM ROUTEREGISTRY;" | mysql -u ${C##_GS_PRODSIVER} -p${1234} ${ORCLCDB}
    echo "DELETE FROM SERVICEREGISTRY;" | mysql -u ${C##_GS_PRODSIVER} -p${1234} ${ORCLCDB}
}

# Delete logs for each application
delete_logs "$ZOOKEEPER_LOG_DIR"
delete_logs "$KAFKA_LOG_DIR"
delete_logs "$ACTIVEMQ_DATA_LOG_DIR"
delete_logs "$ACTIVEMQ_TMP_LOG_DIR"
delete_logs "$TOMCAT_LOG_DIR"

# Delete entries from SQL database
delete_database_entries "ORCLCDB" "C##_GS_PRODSIVER" "1234"

echo "All logs and database entries deleted."
