FROM alpine

ENV DNS_VER 1.3.2
ENV DNS_URL https://github.com/shadowsocks/ChinaDNS/releases/download/$DNS_VER/chinadns-$DNS_VER.tar.gz
ENV DNS_DIR chinadns-$DNS_VER
ENV DNS_DEP vim curl git musl-dev gcc gawk make libtool openssl

VOLUME ["/home/whiteip"]

# build chinadns
RUN apk update && \
    apk upgrade && \
    apk add --update bash $DNS_DEP

RUN wget $DNS_URL && \
    tar -xzvf chinadns-$DNS_VER.tar.gz

WORKDIR "$DNS_DIR"
RUN pwd && \
    ./configure && \
    make install && \
    apk del --purge $DNS_DEP && \
    rm -rf /var/cache/apk/*

WORKDIR /
ADD update-chinaips.sh ./
ADD init ./

RUN echo "0 0 * * * sh update-chinaips.sh" >> /var/spool/cron/crontabs/root

ENTRYPOINT ./init "$DNS_DIR"