#!/bin/bash
process() {
    while read line; do 

        # ignore event when AC is online
        online=$(cat /sys/class/power_supply/AC/online)
        [ $online = "1" ] && continue;

        case "$line" in
            UNBLANK*)
                wakeup
                ;;
            BLANK*)
                echo "Blank"
                ;;
            RUN*)
                echo "Run"
                ;;
            LOCK*)
                echo "Lock"
                ;;
        esac
    done
}

wakeup (){
    xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 0.4
}

xscreensaver-command -watch | process
