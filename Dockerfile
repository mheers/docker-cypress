ARG CYPRESS_IMAGE_VERSION
FROM cypress/browsers:${CYPRESS_IMAGE_VERSION}

ARG CYPRESS_VERSION
ENV CYPRESS_CACHE_FOLDER=/app/.cache

# install cypress
RUN npm_config_yes=true npm install -g cypress@${CYPRESS_VERSION}

# install dependencies
RUN apt --allow-releaseinfo-change update && \
    apt install -y libnss3-tools git && \
    apt install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

# install mkcert
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 -O /usr/bin/mkcert && \
    chmod +x /usr/bin/mkcert && \
    /usr/bin/mkcert -install
