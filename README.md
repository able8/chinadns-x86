# chinadns-x86
run a shadowsocks/ChinaDNS on x86, and auto updates ip list everyday at 0:00 a.m.
upstream version: 1.3.2

## Usage?
```
docker run -itd --restart=always --cap-add=NET_ADMIN --net=host -e CHDNS_PORT=15353 --name router_chinadns_1 dorrypizza/chinadns-x86
```

## Test?
```
dig www.youtube.com @127.0.0.1 -p 15353
```
