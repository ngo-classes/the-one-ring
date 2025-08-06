#!/bin/bash

set -x

# setup code server
sh /home/student/build/code-server.sh #--prefix=/usr/local/

# install code extensions
code-server --install-extension Continue.continue
code-server --install-extension ms-toolsai.jupyter
code-server --install-extension ms-python.python

# setup Python packages
source /opt/venv/python3/bin/activate
pip install jupyter 
pip install jupyter-book mkdocs-material markdown-include mkdocs-table-reader-plugin mkdocs-glightbox mkdocs-jupyter  

sudo cp -R /home/student/.local/share/code-server/extensions /opt/home/student/.local/share/code-server/
sudo cp /home/student/build/entrypoint.sh /usr/local/bin/entrypoint.sh
sudo chmod 755 /usr/local/bin/entrypoint.sh  
