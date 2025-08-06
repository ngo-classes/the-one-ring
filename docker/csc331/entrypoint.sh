#!/bin/bash

echo "---> Starting sshd on the node..."
sudo /usr/sbin/sshd -e

tail -f /dev/null

