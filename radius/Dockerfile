FROM oskarirauta/lede-docker
# innovationgarage/openwrt:snapshot-2018-05-24

# ADD customfeeds.conf /etc/opkg/customfeeds.conf

RUN opkg update
RUN opkg install pgsql-cli
RUN opkg install freeradius2-mod-always freeradius2-mod-attr-filter freeradius2-mod-attr-rewrite freeradius2-mod-chap freeradius2-mod-detail freeradius2-mod-eap freeradius2-mod-eap-gtc freeradius2-mod-eap-md5 freeradius2-mod-eap-mschapv2 freeradius2-mod-eap-peap freeradius2-mod-eap-tls freeradius2-mod-eap-ttls freeradius2-mod-exec freeradius2-mod-expiration freeradius2-mod-expr freeradius2-mod-files freeradius2-mod-ldap freeradius2-mod-logintime freeradius2-mod-mschap freeradius2-mod-pap freeradius2-mod-passwd freeradius2-mod-preprocess freeradius2-mod-radutmp freeradius2-mod-realm freeradius2-mod-sql freeradius2-mod-sql-mysql freeradius2-mod-sql-pgsql freeradius2-mod-sql-sqlite freeradius2-mod-sqlcounter freeradius2-mod-sqllog freeradius2-utils
RUN opkg install shadow-useradd
RUN opkg install shadow-su


ADD freeradius2 /etc/freeradius2
ADD db /root/db

EXPOSE 1812/udp
EXPOSE 1813/udp
