# chinadns-x86
It is a docker image built from shadowsocks/ChinaDNS on x86, updating whitelist at 0:00 a.m. everyday.

## Usage
```
docker run -itd --restart=always --cap-add=NET_ADMIN --net=host -e CHDNS_PORT=15353 --name router_chinadns dorrypizza/chinadns-x86
```

## Test
```
dig www.youtube.com @127.0.0.1 -p 15353
```
