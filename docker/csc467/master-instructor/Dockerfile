FROM linhbngo/csc467:base

ENV SPARK_MASTER_PORT=7077
ENV SPARK_MASTER_WEBUI_PORT=8080
ENV SPARK_MASTER_LOG=/spark/logs

EXPOSE 8080 7077 6066 8888 4040 9009 5001 8088 8000

USER root

COPY . /build
RUN chmod -R 755 /build/*.sh && /build/install.sh && rm -rf /build

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]