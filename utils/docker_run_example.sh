#!/bin/bash

CONFIG_FILE=./haproxy_v2.cfg
CONFIG_FILE=./haproxy_backend_limit.cfg
CONFIG_FILE=./haproxy_x_forwarded_for.cfg
CONFIG_FILE=./haproxy_rate_hdr.cfg
CONFIG_FILE=./haproxy_geoip.cfg
CONFIG_FILE=./haproxy_rate_ip.cfg

ABSDIR=$(dirname `readlink -f $0`)
docker run -it --rm -v $ABSDIR/example:/haproxy-data \
           -p 8080:8080 \
           -e DATA_USER_ID=$(id --user) \
           -e DATA_GROUP_ID=$(id --group) \
           -e EXTRA_WATCH_FILES=/haproxy-data \
           -e CONFIG_FILE=${CONFIG_FILE} \
           procrastinatio/haproxy-docker:latest
#           pgaertig/haproxy:latest
