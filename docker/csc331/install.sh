#!/bin/bash

apt update

DEBIAN_FRONTEND=noninteractive apt install -y \
    gdb \
    valgrind \
    qemu-system-misc \
    gcc-riscv64-unknown-elf \
    python3-six

apt clean
rm -rf /var/lib/apt/lists/*

git clone https://github.com/longld/peda.git /opt/peda
echo "source /opt/peda/peda.py" > /home/student/.gdbinit
chown student:student /home/student/.gdbinit

# setup code server
sh /home/student/build/code-server.sh #--prefix=/usr/local/

sudo cp /home/student/build/entrypoint.sh /usr/local/bin/entrypoint.sh
sudo chmod 755 /usr/local/bin/entrypoint.sh  
