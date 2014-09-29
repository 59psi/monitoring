#!/bin/bash
set -eux

source env.sh

$BASE_PATH/install-zookeeper.sh
$BASE_PATH/install-hbase.sh
$BASE_PATH/install-opentsdb.sh

$BASE_PATH/install-elasticsearch.sh
$BASE_PATH/install-grafana.sh

$BASE_PATH/install-tcollector.sh
