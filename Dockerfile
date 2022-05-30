FROM alpine:3.16

RUN apk add --no-cache \
    git=2.36.1-r0 \
    make=4.3-r0

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories

RUN apk add --no-cache \
    stylua=0.13.1-r0
