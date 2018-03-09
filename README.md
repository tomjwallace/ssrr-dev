# ssrr-dev

### get help with -h

``` sh
docker run --rm fzitou/ssrr-dev -h
```

### change password with -k

``` sh
docker run  fzitou/ssrr-dev -k 123456
```

### run under nobody user with --user nobody

``` sh
docker run  fzitou/ssrr-dev --user nobody
```


### use your own config file

Assuming  `user-config.json` in your home directory :

``` sh
 docker run -p 80:80 -p 443:443 -v ~/user-config.json:/shadowsocks/config.json -d --name ssrr --restart=always fzitou/ssrr-dev --user nobody
```

Assuming `user-config.json` in your current directory :

``` sh
 docker run -p 80:80 -p 443:443 -v "$(pwd)"/user-config.json:/shadowsocks/config.json -d --name ssrr --restart=always fzitou/ssrr-dev --user nobody
```