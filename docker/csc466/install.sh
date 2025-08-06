#!/bin/bash
set -e

log_info() {
  printf "\n\e[0;35m $1\e[0m\n\n"
}

log_info "Base image"

#------------------------------------------
# Install OpenMPI and other Python packages
#------------------------------------------

cd /build
tar xzf openmpi-5.0.6.tar.gz
cd openmpi-5.0.6
./configure --prefix=/opt/openmpi/5.0.6
make all
make install
cd

echo "export OPENMPI_ROOT=/opt/openmpi/5.0.6" >> /etc/profile
echo "export PATH=$PATH:/opt/openmpi/5.0.6/bin" >> /etc/profile
echo "export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/openmpi/5.0.6/include" >> /etc/profile

source /opt/venv/python3/bin/activate
pip install numpy matplotlib

export OPENMPI_ROOT=/opt/openmpi/5.0.6
export PATH=$PATH:/opt/openmpi/5.0.6/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${OPENMPI_ROOT}/include:${OPENMPI_ROOT}/lib
pip install mpi4py

cp /build/entrypoint.sh /usr/local/bin/entrypoint.sh
chmod 755 /usr/local/bin/entrypoint.sh

