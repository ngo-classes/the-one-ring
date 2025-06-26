FROM node:22.11.0-slim

USER root

COPY code-server/ /code-server
COPY start-master.sh /
COPY configs /configs
COPY node-server /node-server
COPY mkdocs/setup_mkdocs.sh /

RUN apt update && \
    apt install -y curl nginx python3-full && \
    curl -fsSL https://code-server.dev/install.sh | sh && \
    mkdir -p /root/.config/code-server/ && \
    cp /code-server/config.yaml /root/.config/code-server/config.yaml && \
    mkdir -p /root/.local/share/code-server/User/ && \
    cp /code-server/settings.json /root/.local/share/code-server/User/ && \
    rm -Rf code-server && \
    apt clean
    
RUN bash setup_mkdocs.sh && \
    rm /setup_mkdocs.sh

RUN ln -s /configs/nginx/sites-available/data /etc/nginx/sites-enabled/data

# 8088: vscode-server# 
# 3000, 4200: Node.js server
# 8000: mkdocs serve
EXPOSE 8088 8000 3000 4200

CMD ["/bin/bash", "/start-master.sh"]
