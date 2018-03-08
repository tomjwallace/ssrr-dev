FROM alpine:3.7

ENV SERVER_PORT 51348

ARG BRANCH=akkariiin/dev
ARG DIR_NAME=akkariiin-dev

RUN if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.ustc.edu.cn/alpine/v3.7/main/" > /etc/apk/repositories ;fi \
    && apk update --no-cache upgrade \
    && apk --no-cache add libsodium python \
    && wget -qO- --no-check-certificate https://github.com/shadowsocksrr/shadowsocksr/archive/$BRANCH.tar.gz | tar -xzf - -C . \
    && cp -R shadowsocksr-$DIR_NAME/shadowsocks . \
    && apk del wget

WORKDIR shadowsocks
COPY user-config.json ./config.json

EXPOSE $SERVER_PORT
ENTRYPOINT [ "python", "server.py"]