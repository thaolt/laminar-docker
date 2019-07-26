#!/bin/bash

mkdir -p ~/.ssh

cp /authorized_keys ~/.ssh/authorized_keys

service ssh start

/usr/bin/laminard


