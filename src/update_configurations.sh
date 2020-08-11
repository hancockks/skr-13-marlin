#!/usr/bin/env sh

set -x 
set -e

SOURCE=$1
shift
DEST=$1
shift

cp "${SOURCE}"/*.h "${DEST}"

FILE=$DEST/Configuration.h
sed -i 's|^#define SERIAL_PORT 0$|#define SERIAL_PORT -1 // KSH|g' $FILE
sed -i 's|^//#define SERIAL_PORT_2 -1$|#define SERIAL_PORT_2 0 // KSH|g' $FILE
sed -i 's|^#define BAUDRATE.*$|#define BAUDRATE 250000 // KSH|g' $FILE
sed -i 's|#define MOTHERBOARD .*$|#define MOTHERBOARD BOARD_BTT_SKR_V1_3 // KSH|g' $FILE

# TMC2209 drivers
sed -i 's|//#define X_DRIVER_TYPE.*|#define X_DRIVER_TYPE  TMC2209 // KSH|g' $FILE
sed -i 's|//#define Y_DRIVER_TYPE.*|#define Y_DRIVER_TYPE  TMC2209 // KSH|g' $FILE
sed -i 's|//#define Z_DRIVER_TYPE.*|#define Z_DRIVER_TYPE  TMC2209 // KSH|g' $FILE
sed -i 's|//#define E0_DRIVER_TYPE.*|#define E0_DRIVER_TYPE  TMC2209 // KSH|g' $FILE

# BLTouch V3.1
sed -i 's|//#define BLTOUCH|#define BLTOUCH // KSH|g' $FILE
sed -i 's|  //#define ENDSTOPPULLUP_ZMIN_PROBE|  #define ENDSTOPPULLUP_ZMIN_PROBE // KSH|g' $FILE
sed -i 's|^#define Z_MIN_ENDSTOP_INVERTING false|#define Z_MIN_ENDSTOP_INVERTING true // KSH|g' $FILE
#sed -i 's|//#define ENDSTOP_INTERRUPTS_FEATURE|#define ENDSTOP_INTERRUPTS_FEATURE // KSH|g' $FILE

sed -i 's|^#define NOZZLE_TO_PROBE_OFFSET { 10, 10, 0 }|#define NOZZLE_TO_PROBE_OFFSET { -44, -15, 0 } // KSH|g' $FILE
sed -i 's|^  #define MIN_SOFTWARE_ENDSTOP_Z|//  #define MIN_SOFTWARE_ENDSTOP_Z // KSH|g' $FILE
sed -i 's|^//#define AUTO_BED_LEVELING_BILINEAR|#define AUTO_BED_LEVELING_BILINEAR // KSH|g' $FILE
sed -i 's|^    //#define EXTRAPOLATE_BEYOND_GRID|    #define EXTRAPOLATE_BEYOND_GRID // KSH|g' $FILE
sed -i 's|^//#define LCD_BED_LEVELING|#define LCD_BED_LEVELING // KSH|g' $FILE
sed -i 's|^//#define Z_SAFE_HOMING|#define Z_SAFE_HOMING // KSH|g' $FILE

FILE=$DEST/Configuration_adv.h

sed -i 's|#define Z_STEPPER_ALIGN_ITERATIONS.*|#define Z_STEPPER_ALIGN_ITERATIONS 3 // KSH|g' $FILE
sed -i 's|#define E0_AUTO_FAN_PIN.*|#define E0_AUTO_FAN_PIN P2_04 // KSH|g' $FILE
sed -i 's|//#define SDCARD_CONNECTION LCD|#define SDCARD_CONNECTION ONBOARD // KSH|g' $FILE
sed -i 's|//#define MONITOR_DRIVER_STATUS|#define MONITOR_DRIVER_STATUS // KSH|g'  $FILE
sed -i 's|//#define TMC_DEBUG|#define TMC_DEBUG // KSH|g'  $FILE
#sed -i 's|//#define HYBRID_THRESHOLD|#define HYBRID_THRESHOLD // KSH|g'  $FILE

sed -i 's|#define X_CURRENT .*|#define X_CURRENT       600 // KSH|g' $FILE
sed -i 's|#define Y_CURRENT .*|#define Y_CURRENT       600 // KSH|g' $FILE
sed -i 's|#define Z_CURRENT .*|#define Z_CURRENT       600 // KSH|g' $FILE
sed -i 's|#define E0_CURRENT .*|#define E0_CURRENT      650 // KSH|g' $FILE

# BLTouch V3.1
sed -i 's|//#define BLTOUCH_DELAY 500|#define BLTOUCH_DELAY 500 // KSH|g' $FILE
sed -i 's|//#define BLTOUCH_SET_5V_MODE|#define BLTOUCH_SET_5V_MODE // KSH|g' $FILE
#sed -i 's|//#define BLTOUCH_FORCE_SW_MODE|#define BLTOUCH_FORCE_SW_MODE // KSH|g' $FILE
