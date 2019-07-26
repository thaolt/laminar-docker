#!/bin/bash

mkdir -p ~/.ssh

cp /authorized_keys ~/.ssh/authorized_keys

# service cron start
# service ssh start

sed -i "s/\#LAMINAR_BIND_HTTP=\*\:8080/LAMINAR_BIND_HTTP=0.0.0.0:${PORT}/g" /etc/laminar.conf
export LAMINAR_BIND_HTTP="*:${PORT}"
/usr/bin/laminard &

ssh-keygen -t rsa -f ~/ssh_host_rsa_key -N ''
/usr/sbin/sshd -D -p 2222 -h ~/ssh_host_rsa_key &

ssh -tt -o StrictHostKeyChecking=no -R 0:localhost:2222 serveo.net

