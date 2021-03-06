#!/usr/bin/env sh

set -x 
set -e

mkdir -p /tmp/build
rm -f /marlin/.pio/build/LPC1768/firmware.bin /tmp/build/firmware

git checkout $MARLIN_BRANCH
git pull

case $MARLIN_BRANCH in
    "2.0.x")
        dir="/tmp/Configurations-release-2.0.6/config/examples/Creality/Ender-3 Pro";;
    "bugfix-2.0.x")
        dir="/tmp/Configurations-bugfix-2.0.x/config/examples/Creality/Ender-3 Pro";;
    *)
        echo "unhandled branch; exiting" && exit 1;;
esac

sh /marlin/update_configurations.sh "${dir}" "/marlin/Marlin"	

platformio run --environment LPC1768 && cp /marlin/.pio/build/LPC1768/firmware.bin /tmp/build
