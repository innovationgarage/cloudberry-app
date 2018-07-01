#! /bin/bash

download () {
    while read name image repo offset; do
        echo "$offset" > "${name}.offset"

        if ! [ -e "${name}.img" ]; then
            basename="$(basename "$image")"

            wget -O "$basename" "$image"

            ext="$(echo $basename | sed -e "s+.*\.++g")"
            if [ "$ext" == "gz" ]; then
                gunzip "$basename"
                basename="$(basename "$basename" .gz)"
            fi

            mv "$basename" "${name}.img"
        fi

        if [ -e "${name}" ]; then
            (
                cd "${name}"
                git pull origin master
            )
        else
            git clone "$repo" "${name}"
        fi
    done
}

# Format is "name image repo offset", one entry per line
download <<EOF
OrangePi-R1 https://openwrt.innovationgarage.no/targets/sunxi/cortexa7/openwrt-sunxi-cortexa7-sun8i-h2-plus-orangepi-r1-ext4-sdcard.img.gz https://github.com/innovationgarage/cloudberry-device.git 23068672
RaspberryPI-1 https://openwrt.innovationgarage.no/targets/brcm2708/bcm2708/lede-brcm2708-bcm2708-rpi-ext4-sdcard.img https://github.com/innovationgarage/cloudberry-device.git 23068672
RaspberryPI-2 https://openwrt.innovationgarage.no/targets/brcm2708/bcm2709/lede-brcm2708-bcm2709-rpi-2-ext4-sdcard.img.gz https://github.com/innovationgarage/cloudberry-device.git 23068672
EOF
