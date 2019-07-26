#!/bin/bash

mkdir -p ~/.ssh

cp /authorized_keys ~/.ssh/authorized_keys

service cron start
service ssh start

sed -i "s/\#LAMINAR_BIND_HTTP=\*\:8080/LAMINAR_BIND_HTTP=*:${PORT}/g" /etc/laminar.conf
/usr/bin/laminard &

ssh -R 0:localhost:22 serveo.net
