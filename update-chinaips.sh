#!/bin/bash
dir=/home/whiteip
wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > $dir/tmp
[ -s $dir/tmp ] && mv $dir/tmp $dir/chinaips && echo "$(date +"%y-%m-%d %T") update chinaips success" || echo "[error] update chinaips failed"