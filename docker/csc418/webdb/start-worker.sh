#!/bin/bash

mkdir -p /data/db/log
mkdir -p /data/db/mongodb
mongod --config /etc/mongod.conf

