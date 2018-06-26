#! /bin/sh

export XAUTHORITY=/root/.Xauthority.outer
OUTER_HOSTNAME=$(cat /outer_hostname)

NEW_XAUTHORITY=/root/.Xauthority
touch $NEW_XAUTHORITY


xauth nlist "${OUTER_HOSTNAME}/unix$DISPLAY" |
    sed -e 's/^..../ffff/' |
    xauth -f $NEW_XAUTHORITY nmerge -

export XAUTHORITY=$NEW_XAUTHORITY

xterm

