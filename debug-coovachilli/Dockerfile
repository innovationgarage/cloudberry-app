FROM oskarirauta/lede-docker
# innovationgarage/openwrt:snapshot-2018-05-24

# ADD customfeeds.conf /etc/opkg/customfeeds.conf

RUN opkg update
RUN opkg install pgsql-cli
RUN opkg install freeradius2-utils
RUN opkg install coova-chilli

ADD etc/config/chilli /etc/config/chilli
ADD etc/config/network /etc/config/network
ADD etc/chilli /etc/chilli

# Turn on debug logging
ADD etc/init.d/chilli /etc/init.d/chilli

#RUN cd /etc/rc.d; ln -s ../init.d/network S18network
RUN cd /etc/rc.d; ln -s ../init.d/firewall S19firewall

ADD init-coovachilli.sh /sbin/init-coovachilli.sh
CMD ["/bin/busybox", "sh", "/sbin/init-coovachilli.sh"]