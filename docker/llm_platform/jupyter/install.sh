#!/bin/bash

pip install --no-cache-dir jupyter ollama langchain langchain-commmunity

sudo cp /build/entrypoint.sh /usr/local/bin/entrypoint.sh
sudo chmod 755 /usr/local/bin/entrypoint.sh
