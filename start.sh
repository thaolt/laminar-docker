#!/bin/bash

mkdir -p ~/.ssh

cp /authorized_keys ~/.ssh/authorized_keys

service cron start
service ssh start

/usr/bin/laminard


