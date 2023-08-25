#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

main () {

    # Widgets
    cpu=$($parent_path/cpu.sh)
    mem=$($parent_path/mem.sh)
    batt=$($parent_path/batt.sh)
    therm=$($parent_path/therm.sh)
    bright=$($parent_path/bright.sh)
    time=$($parent_path/time.sh)

    # Output
    out=" $cpu | $mem | $therm | $batt | $bright | $time "
    xsetroot -name "$out"
}

main
