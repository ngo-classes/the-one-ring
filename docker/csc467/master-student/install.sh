#!/bin/bash
set -e

log_info() {
  printf "\n\e[0;35m $1\e[0m\n\n"
}

log_info "Master Image (Student Version)"

cp /build/entrypoint.sh /usr/local/bin/entrypoint.sh