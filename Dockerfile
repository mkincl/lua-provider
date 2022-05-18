FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
       git=1:2.30.2-1 \
       make=4.3-4.1 \
    && rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3059
RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
       curl=7.74.0-1.3+deb11u1 \
       unzip=6.0-26 \
       ca-certificates=20210119 \
    && rm -rf /var/lib/apt/lists/*

ENV STYLUA_VERSION=0.13.1
ENV STYLUA_URL=https://github.com/JohnnyMorganz/StyLua/releases/download/v$STYLUA_VERSION/stylua-linux.zip

RUN curl -sSfLO $STYLUA_URL \
    && unzip stylua-linux.zip -d /usr/local/bin/ \
    && chmod u+x /usr/local/bin/stylua \
    && rm stylua-linux.zip
