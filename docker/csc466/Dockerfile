FROM --platform=linux/amd64 linhbngo/onering:base

USER root

COPY . /build
RUN sudo chmod -R 755 /build/*.sh && /build/install.sh && rm -rf /build
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
