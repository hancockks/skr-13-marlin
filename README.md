# marlin-firmware-build

This is a build system for the following configuration:
1. Ender 3 Pro
2. Bigtree Tech SKR 1.3
3. TMC2209
4. BLTouch 3.1 (genuine)
5. Physical endstops on X,Y (requires removing diagnostic jumpers XST,YST,ZST)
   
The Dockerfile uses platformIO and a build script that:
1. Checks out the specified branch (see below)
2. Downloads the configuration example files from github
3. Runs a script that uses sed to modify individual Configuration.h and Configuration_adv.h. This is in attempt to make the script more forward-compatible as the configuration file versions change.
4. builds the firmware and places the firmare.bin in /tmp/build which should be mapped to a local volume

This has been tested on the marlin 2.0.5 release and the bugfix-2.0.x as of the marlin 2.0.5 release timing.  Should be easily modified as future versions are released.

## Customizing

You'll have to configure NOZZLE_TO_PROBE_OFFSET for your specific mount.  The -44, -15 should work for the following Thingiverse mounts:

https://www.thingiverse.com/thing:3148733 (sliding mount)
https://www.thingiverse.com/thing:4078668 (thicker back plate)

## To build:

From the skr-13-marlin directory:<br>
`docker build -t marlin .`

## To run:

`docker run -e MARLIN_BRANCH=bugfix-2.0.x -v ${PWD}/build:/tmp/build marlin`
