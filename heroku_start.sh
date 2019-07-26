#!/bin/bash

mkdir -p ~/.ssh

cp /authorized_keys ~/.ssh/authorized_keys

service cron start
service ssh start

ssh -R 0:localhost:22 serveo.net

/usr/bin/laminard


