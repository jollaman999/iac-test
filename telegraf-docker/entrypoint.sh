#!/bin/bash

TELEGRAF_BASE_CONFIGURATION_LOCATION="/etc/telegraf/telegraf.conf.base"
TELEGRAF_CONFIGURATION_LOCATION="/etc/telegraf/telegraf.conf"

cp ${TELEGRAF_BASE_CONFIGURATION_LOCATION} ${TELEGRAF_CONFIGURATION_LOCATION}

sed -i "s/TELEGRAF_SERVER_UUID/${TELEGRAF_SERVER_UUID}/" ${TELEGRAF_CONFIGURATION_LOCATION}
sed -i "s/TELEGRAF_DB_IP/${TELEGRAF_DB_IP}/" ${TELEGRAF_CONFIGURATION_LOCATION}
sed -i "s/TELEGRAF_CLUSTER_IP_LIST/${TELEGRAF_CLUSTER_IP_LIST}/" ${TELEGRAF_CONFIGURATION_LOCATION}

/etc/init.d/ssh start

/usr/bin/telegraf
