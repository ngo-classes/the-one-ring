#!/bin/bash
set -e

log_info() {
  printf "\n\e[0;35m $1\e[0m\n\n"
}

log_info "Base image"

pip3 install jupyter flask numpy pandas nltk matplotlib scikit-learn