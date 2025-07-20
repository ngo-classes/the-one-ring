#!/bin/bash

# setup code server
sudo sh /home/student/build/code-server.sh --prefix=/usr/local/

sudo cp /home/student/build/entrypoint.sh /usr/local/bin/entrypoint.sh
sudo chmod 755 /usr/local/bin/entrypoint.sh  
