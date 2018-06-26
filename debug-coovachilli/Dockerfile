FROM oskarirauta/lede-docker
# innovationgarage/openwrt:snapshot-2018-05-24

# ADD customfeeds.conf /etc/opkg/customfeeds.conf

RUN opkg update
RUN opkg install pgsql-cli
RUN opkg install freeradius2-utils
RUN opkg install coova-chilli
RUN opkg install git-http
RUN opkg install ca-certificates
RUN opkg install ca-bundle
RUN opkg install rsync
RUN opkg install haserl

RUN cd /etc/rc.d; ln -s ../init.d/network S18network
RUN cd /etc/rc.d; ln -s ../init.d/firewall S19firewall

RUN git clone https://github.com/innovationgarage/cloudberry-coovachilli.git
RUN rsync -a cloudberry-coovachilli/etc/ /etc/

# Only way to shut up BusyBox when run as /bin/sh < file
# Workaround for haserl...
RUN rm /etc/banner
RUN sed -e 's+^root:[^:]*:\(.*\)+root:XXXX:\1+g' -i /etc/shadow

ADD init-coovachilli.sh /sbin/init-coovachilli.sh
CMD ["/bin/busybox", "sh", "/sbin/init-coovachilli.sh"]