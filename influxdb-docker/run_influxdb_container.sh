#!/bin/sh

GATEWAY=192.168.124.254
SUBNET=192.168.124.0/24
INFLUX_DB_IP=192.168.124.100

docker network create --gateway $GATEWAY --subnet $SUBNET influxdb_subnet

docker run -it -d --name influxdb --network influxdb_subnet --ip $INFLUX_DB_IP \
      -p 8086:8086 \
      -v $PWD/influxdb.conf:/etc/influxdb/influxdb.conf:ro \
      -v $PWD/influxdb/:/var/lib/influxdb/ \
      influxdb:1.8 -config /etc/influxdb/influxdb.conf
