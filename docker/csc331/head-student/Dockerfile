FROM --platform=linux/amd64 csc331:base

USER student

COPY . /home/student/build
RUN sudo chmod -R 755 /home/student/build/*.sh && /home/student/build/install.sh && sudo rm -rf /home/student/build
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

