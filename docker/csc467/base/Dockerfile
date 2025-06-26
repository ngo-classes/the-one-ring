FROM spark:3.5.2-java17-python3
 
USER root

COPY . /build
RUN chmod -R 755 /build/*.sh && /build/install.sh && rm -rf /build