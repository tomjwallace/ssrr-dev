FROM alpine:latest

ENV SERVER_PORT 51348

ARG BRANCH=akkariiin/dev
ARG DIR_NAME=akkariiin-dev

RUN apk update --no-cache upgrade \
    && apk --no-cache add libsodium python \
    && wget -qO- --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C . \
    && cp -R shadowsocksr-$DIR_NAME/shadowsocks . \
    && apk del wget

WORKDIR shadowsocks
COPY user-config.json ./user-config.json

EXPOSE $SERVER_PORT
ENTRYPOINT [ "python", "server.py"]