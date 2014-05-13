#!/bin/bash
BASE_PATH=`pwd`
SSL_PATH=$BASE_PATH/tmp/ssl_certs

cp $BASE_PATH/etc/rabbitmq/rabbitmq.config /etc/rabbitmq

mkdir -p /etc/rabbitmq/ssl

cp $SSL_PATH/server/key.pem /etc/rabbitmq/ssl
cp $SSL_PATH/server/cert.pem /etc/rabbitmq/ssl
cp $SSL_PATH/sensu_ca/cacert.pem /etc/rabbitmq/ssl

service rabbitmq-server restart

rabbitmqctl add_vhost /sensu
rabbitmqctl add_user sensu monit0r
rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"