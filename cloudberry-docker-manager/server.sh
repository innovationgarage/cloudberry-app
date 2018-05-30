#! /bin/sh

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

mkdir -p /root/.config

cloudberry-docker-manager init "${OPENWISP_URL}" "${OPENWISP_UUID}" "${OPENWISP_KEY}"
while sleep 5; do cloudberry-docker-manager update; done
