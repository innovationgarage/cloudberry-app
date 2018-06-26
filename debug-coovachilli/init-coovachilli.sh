#! /bin/sh

set -x

mkdir /dev/net
mknod /dev/net/tun c 10 200

# From https://stackoverflow.com/q/20762575/8741642
mask2cdr () {
   # Assumes there's no "255." after a non-255 byte in the mask
   local x=${1##*255.}
   set -- 0^^^128^192^224^240^248^252^254^ $(( (${#1} - ${#x})*2 )) ${x%%.*}
   x=${1%%$3*}
   echo $(( $2 + (${#x}/4) ))
}

# The following is a hack to fix two issues:
# - You can not define an interface in /etc/network that gets its ip from Docker
#   - Docker sets up interface ip:s before the container starts, and
#     does not provide dhcp
# - Docker-compose assigns networks to interfaces randomly! https://github.com/docker/compose/issues/4645
# Assumptions: We only have lan and wan. Wan is default gateway.

WAN_GATEWAY="$(route -n | grep ^0.0.0.0 | sed -e "s/^[^ ]* *\([^ ]*\) .*/\1/g")"

WAN_IFNAME="$(route -n | grep ^0.0.0.0 | sed -e "s+.* ++g")"
if [ "${WAN_IFNAME}" == "eth0" ]; then
    LAN_IFNAME='eth1'
else
    LAN_IFNAME='eth0'
fi

WAN_IPADDR="$(ifconfig "${WAN_IFNAME}" | grep inet | sed -e "s+.*inet addr:\([^ ]*\).*+\1+g")"
WAN_NETMASK="$(ifconfig "${WAN_IFNAME}" | grep inet | sed -e "s+.*Mask:\([^ ]*\).*+\1+g")"

LAN_IPADDR="$(ifconfig "${LAN_IFNAME}" | grep inet | sed -e "s+.*inet addr:\([^ ]*\).*+\1+g")"
LAN_NETMASK="$(ifconfig "${LAN_IFNAME}" | grep inet | sed -e "s+.*Mask:\([^ ]*\).*+\1+g")"
LAN_CIDR="$(mask2cdr "${LAN_NETMASK}")"
LAN_NETWORK="$(route -n | grep "${LAN_IFNAME}" | sed -e "s/^\([^ ]*\) .*/\1/g")"

uci set chilli.@chilli[0].dhcpif="${LAN_IFNAME}"
uci set chilli.@chilli[0].uamlisten="${LAN_IPADDR}"
uci set chilli.@chilli[0].net="${LAN_NETWORK}/${LAN_CIDR}"
uci set chilli.@chilli[0].uamallowed="$(uci get chilli.@chilli[0].uamallowed),${LAN_IPADDR}"

uci set chilli.@chilli[0].uamserver="http://${LAN_IPADDR}:4990/www/login.chi"
uci set chilli.@chilli[0].uamhomepage="http://${LAN_IPADDR}:3990/www/coova.html"


uci set network.lan.ifname="${LAN_IFNAME}"
uci set network.lan.ipaddr="${LAN_IPADDR}"
uci set network.lan.netmask="${LAN_NETMASK}"

uci set network.wan.ifname="${WAN_IFNAME}"
uci set network.wan.ipaddr="${WAN_IPADDR}"
uci set network.wan.netmask="${WAN_NETMASK}"
uci set network.wan.gateway="${WAN_GATEWAY}"

uci commit

exec /sbin/init
