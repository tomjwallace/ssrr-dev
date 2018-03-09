# ssrr-dev

get help with -h
``` docker run --rm fzitou/ssrr-dev -h   ```
change password with -k
``` docker run  fzitou/ssrr-dev -k 123456 ```
run under nobody user with --user nobody
``` docker run  fzitou/ssrr-dev --user nobody```

example:
``` docker run  fzitou/ssrr-dev --user nobody -k 123456```

### use your own config file
Assuming your config.json in your home directory
` docker run -p 80:80 -p 443:443 -v ~/user-config.json:/shadowsocks/config.json -d --name ssrr --restart=always fzitou/ssrr-dev --user nobody `

Assuming your config.json in your current directory
` docker run -p 80:80 -p 443:443 -v "$(pwd)"/user-config.json:/shadowsocks/config.json -d --name ssrr --restart=always fzitou/ssrr-dev --user nobody `