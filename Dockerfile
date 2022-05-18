FROM alpine:3

RUN apk add --no-cache \
    git=2.34.2-r0 \
    make=4.3-r0

ENV STYLUA_VERSION=0.13.1
ENV STYLUA_URL=https://github.com/JohnnyMorganz/StyLua/releases/download/v$STYLUA_VERSION/stylua-linux.zip

RUN wget -q $STYLUA_URL \
    && unzip stylua-linux.zip -d /usr/local/bin/ \
    && chmod u+x /usr/local/bin/stylua \
    && rm stylua-linux.zip
