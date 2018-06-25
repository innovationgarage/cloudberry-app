#! /bin/bash

mkdir -p /images
cd /images

NEW_VERSION="$(cat /source_images/VERSION)"
if [ -e /images/VERSION ]; then
    OLD_VERSION="$(cat /images/VERSION)"
else
    OLD_VERSION=''
fi

if [ "$NEW_VERSION" != "$OLD_VERSION" ]; then
    rsync -a --progress /source_images/ /images/
    /images/download.sh
fi
