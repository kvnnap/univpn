FROM alpine
MAINTAINER Kevin Napoli kvnnap@gmail.com

COPY reres.sh /etc/periodic/15min/reres.sh
COPY init.sh /init.sh

RUN apk --no-cache add wireguard-tools bash \
 && wget https://raw.githubusercontent.com/WireGuard/wireguard-tools/master/contrib/reresolve-dns/reresolve-dns.sh -O /usr/bin/reresolve-dns.sh \
 && chmod +x /usr/bin/reresolve-dns.sh \
 && chmod +x /etc/periodic/15min/reres.sh \
 && chmod +x /init.sh

VOLUME /etc/wireguard

ENTRYPOINT ["/init.sh"]
