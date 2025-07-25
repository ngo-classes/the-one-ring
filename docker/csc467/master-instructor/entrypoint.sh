#!/bin/bash

export SPARK_MASTER_HOST=`hostname`

. "/opt/spark/sbin/spark-config.sh"

. "/opt/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/opt/spark

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

cd / && jupyter lab --port=8888 --NotebookApp.token='' --no-browser --ip=0.0.0.0 --allow-root &
code-server code-server --auth none --cert false --bind-addr 0.0.0.0:8088 &

cd /opt/spark/bin && /opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out


