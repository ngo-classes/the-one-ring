#!/bin/bash
set -e

log_info() {
  printf "\n\e[0;35m $1\e[0m\n\n"
}

log_info "Master image"

# install code-serve
sh /build/code-server.sh --prefix=/usr/local/

apt update
apt install -y unzip
apt clean

pip3 install jupyter-book mkdocs-material markdown-include mkdocs-table-reader-plugin 
pip3 install mkdocs-glightbox mkdocs-jupyter mkdocs-mermaid2-plugin

cp /build/entrypoint.sh /usr/local/bin/entrypoint.sh
