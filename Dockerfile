FROM alpine:3.17

RUN apk add --no-cache \
    git=2.38.4-r1 \
    make=4.3-r1

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories

RUN apk add --no-cache \
    stylua=0.15.3-r0
