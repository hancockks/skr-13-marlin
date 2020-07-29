#!/usr/bin/env sh

set -x 

mkdir -p /tmp/build
rm -f /marlin/.pio/build/LPC1768/firmware.bin /tmp/build/firmware

git checkout $MARLIN_BRANCH
git pull

case $MARLIN_BRANCH in
    "2.0.x")
        dir="Configurations-release-2.0.5";;
    "bugfix-2.0.x")
        dir="Configurations-bugfix-2.0.x";;
    *)
        echo "unhandled branch; exiting" && exit 1;;
esac

sh /tmp/update_configurations.sh /tmp/${dir}/config/examples/Creality/Ender-3 /marlin/Marlin

platformio run --environment LPC1768 && cp /marlin/.pio/build/LPC1768/firmware.bin /tmp/build
