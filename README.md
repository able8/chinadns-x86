# chinadns-x86
run a shadowsocks/ChinaDNS on x86, and auto updates ip list everyday at 0:00 a.m.
upstream version: 1.3.2

## How to run?
```
docker run -itd --restart=always --cap-add=NET_ADMIN --net=host -e CHDNS_PORT=[ your port ] --name router_chinadns_1 dorrypizza/chinadns-x86
```

## How to check dns status?
```
dig [ your site ] @127.0.0.1 -p [ your port ]
geoiplookup [ ips you get ]
```

## Where is ip list?
You can check ip list in file '/home/whiteip/chinaips'.
You could also get this file in another container which 'volumes-from' chinadns container.