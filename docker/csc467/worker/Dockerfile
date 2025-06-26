FROM csc467:base

ENV SPARK_WORKER_WEBUI_PORT=8081
ENV SPARK_WORKER_LOG=/spark/logs
ENV SPARK_MASTER="spark://spark-master:7077"

EXPOSE 8081
USER root

COPY . /build
RUN chmod -R 755 /build/*.sh && /build/install.sh && rm -rf /build

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
