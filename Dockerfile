FROM alpine:3.23

RUN apk add --no-cache \
    git=2.52.0-r0 \
    make=4.4.1-r3

RUN apk add --no-cache \
    stylua=2.3.1-r0
