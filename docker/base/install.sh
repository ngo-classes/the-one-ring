#!/bin/bash
set -e

log_info() {
  printf "\n\e[0;35m $1\e[0m\n\n"
}

log_info "Base image"

source /build/base.config

#------------------------
# Install base image packages
#------------------------

apt update

# Development tools
DEBIAN_FRONTEND=noninteractive apt install -y \
    build-essential \
    software-properties-common \
    libssl-dev \
    libffi-dev \
    pkg-config \
    libpython3-dev \
    zlib1g-dev

# Python runtime and pip
DEBIAN_FRONTEND=noninteractive apt install -y \
    python3 \
    python3-pip \
    python3-venv

python3 -m venv /opt/venv/python3


# System tools and editors
DEBIAN_FRONTEND=noninteractive apt install -y \
    curl \
    wget \
    vim \
    nano \
    tmux \
    bash-completion \
    tar \
    perl \
    iputils-ping \
    unzip

# Authentication and directory services
DEBIAN_FRONTEND=noninteractive apt install -y \
    openssh-server \
    sudo \
    openssl \
    ldap-utils \
    sssd \
    sssd-tools

log_info "Generating ssh host keys.."
ssh-keygen -A
sed -i 's/^#\?ChallengeResponseAuthentication .*/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config

#------------------------
# Setup user accounts
#------------------------

idnumber=1001
for uid in $USERS
do
    log_info "Bootstrapping $uid user account.."
    adduser --uid $idnumber --disabled-password --gecos "" $uid
    echo "$uid:${PASSWD_student}" | chpasswd
    echo "$uid ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$uid
    chmod 0440 /etc/sudoers.d/$uid
    idnumber=$((idnumber + 1))
done


#------------------------
# Final cleanup and setup
#------------------------
apt clean
rm -rf /var/lib/apt/lists/*

cp -R /build/home/ /opt/
mkdir -p /run/sshd

