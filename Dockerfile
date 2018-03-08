FROM alpine:latest

ENV SERVER_PORT 80 443

ARG BRANCH=akkariiin/dev
ARG WORK=ssrr

RUN apk update --no-cache upgrade \
    && apk --no-cache add libsodium python \
    && mkdir -p $WORK \
    && wget -qO- --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C $WORK \
    && apk del wget

WORKDIR $WORK/shadowsocksr-$BRANCH/shadowsocks
COPY user-config.json $WORK/shadowsocks/config.json


EXPOSE $SERVER_PORT
ENTRYPOINT [ "python", "server.py"]