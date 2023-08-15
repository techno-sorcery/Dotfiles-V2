#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
sep="  |  "

main () {

    # Widgets
    cpu=$($parent_path/cpu.sh)
    mem=$($parent_path/mem.sh)
    batt=$($parent_path/batt.sh)
    therm=$($parent_path/therm.sh)
    bright=$($parent_path/bright.sh)
    time=$($parent_path/time.sh)

    # Output
    echo $cpu $sep $mem $sep $therm $sep $batt $sep $bright $sep $time
}

while true; do
    main
    sleep 0.5
done
