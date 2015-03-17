#!/bin/bash

bash /opt/deploy/init-home.sh

echo "starting ssh"
bash /opt/deploy/ssh.sh
#sh -c '/usr/sbin/sshd -D'
