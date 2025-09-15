FROM --platform=linux/amd64 linhbngo/onering-amd:base AS stage-amd64

FROM --platform=linux/arm64/v8 linhbngo/onering-arm:base AS stage-arm64

ARG TARGETARCH

FROM stage-${TARGETARCH} AS final

USER student

COPY . /home/student/build
RUN sudo chmod -R 755 /home/student/build/*.sh && sudo /home/student/build/install.sh && sudo rm -rf /home/student/build
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

