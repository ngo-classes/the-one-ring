FROM --platform=linux/amd64 ubuntu:24.04 AS stage-amd64

FROM --platform=linux/arm64/v8 ubuntu:24.04 AS stage-arm64

ARG TARGETARCH

FROM stage-${TARGETARCH} AS final

USER root

COPY . /build
RUN chmod -R 755 /build/*.sh && /build/install.sh && rm -rf /build
