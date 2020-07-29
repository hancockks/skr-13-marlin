#!/usr/bin/env sh

set -x 

SOURCE=$1
shift
DEST=$1
shift

cp $SOURCE/* $DEST

FILE=$DEST/Configuration.h
sed -i 's|^#define SERIAL_PORT 0$|#define SERIAL_PORT -1|g' $FILE
sed -i 's|^//#define SERIAL_PORT_2 -1$|#define SERIAL_PORT_2 0|g' $FILE
sed -i 's|#define MOTHERBOARD BOARD_MELZI_CREALITY|#define MOTHERBOARD BOARD_BTT_SKR_V1_3|g' $FILE
sed -i 's|//#define X_DRIVER_TYPE  A4988|#define X_DRIVER_TYPE  TMC2209|g' $FILE
sed -i 's|//#define Y_DRIVER_TYPE  A4988|#define Y_DRIVER_TYPE  TMC2209|g' $FILE
sed -i 's|//#define Z_DRIVER_TYPE  A4988|#define Z_DRIVER_TYPE  TMC2209|g' $FILE
sed -i 's|//#define E0_DRIVER_TYPE  A4988|#define E0_DRIVER_TYPE  TMC2209|g' $FILE

# BLTouch V3.1
sed -i 's|//#define BLTOUCH|#define BLTOUCH|g' $FILE
sed -i 's|^#define NOZZLE_TO_PROBE_OFFSET { 10, 10, 0 }|#define NOZZLE_TO_PROBE_OFFSET { 10, 10, 0 }|g' $FILE
sed -i 's|^#define Z_MIN_ENDSTOP_INVERTING false|#define Z_MIN_ENDSTOP_INVERTING true|g' $FILE
sed -i 's|^  #define MIN_SOFTWARE_ENDSTOP_Z|//  #define MIN_SOFTWARE_ENDSTOP_Z|g' $FILE
sed -i 's|^//#define AUTO_BED_LEVELING_BILINEAR|#define AUTO_BED_LEVELING_BILINEAR|g' $FILE
sed -i 's|^    //#define EXTRAPOLATE_BEYOND_GRID|    #define EXTRAPOLATE_BEYOND_GRID|g' $FILE
sed -i 's|^//#define LCD_BED_LEVELING|#define LCD_BED_LEVELING|g' $FILE
sed -i 's|^//#define Z_SAFE_HOMING|#define Z_SAFE_HOMING|g' $FILE

FILE=$DEST/Configuration_adv.h
sed -i 's|#define E0_AUTO_FAN_PIN -1|#define E0_AUTO_FAN_PIN P2_04|g' 
sed -i 's|//#define SDCARD_CONNECTION LCD|#define SDCARD_CONNECTION ONBOARD|g' 
sed -i 's|//#define MONITOR_DRIVER_STATUS|#define MONITOR_DRIVER_STATUS|g' 
sed -i 's|//#define HYBRID_THRESHOLD|#define HYBRID_THRESHOLD|g' 
sed -i 's|//#define TMC_DEBUG|#define TMC_DEBUG|g' 

sed -i 's|#define X_CURRENT       800|#define X_CURRENT       600|g' 
sed -i 's|#define Y_CURRENT       800|#define Y_CURRENT       600|g' 
sed -i 's|#define Z_CURRENT       800|#define Z_CURRENT       600|g' 
sed -i 's|#define E0_CURRENT      800|#define E0_CURRENT      650|g' 

# BLTouch V3.1
sed -i 's|^//#define BLTOUCH_DELAY 500|#define BLTOUCH_DELAY 500|g' 
sed -i 's|^//#define BLTOUCH_FORCE_SW_MODE|#define BLTOUCH_FORCE_SW_MODE|g' 
sed -i 's|^//#define BLTOUCH_SET_5V_MODE|#define BLTOUCH_SET_5V_MODE|g' 
