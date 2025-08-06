#!/bin/bash

apt update

DEBIAN_FRONTEND=noninteractive apt install -y \
    gdb \
    valgrind \
    qemu-system-misc \
    gcc-riscv64-unknown-elf 

apt clean
rm -rf /var/lib/apt/lists/*

sudo cp /home/student/build/entrypoint.sh /usr/local/bin/entrypoint.sh
sudo chmod 755 /usr/local/bin/entrypoint.sh  
