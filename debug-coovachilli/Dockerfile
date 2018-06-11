FROM oskarirauta/lede-docker
# innovationgarage/openwrt:snapshot-2018-05-24

# ADD customfeeds.conf /etc/opkg/customfeeds.conf

RUN opkg update
RUN opkg install pgsql-cli
RUN opkg install freeradius2-utils
RUN opkg install coova-chilli

ADD etc/config/chilli /etc/config/chilli
