#!/bin/bash

### config

BGOPACITY=00
FGOPACITY=ff

####

killall -q polybar

while pgrep -x polybar > /dev/null
    do sleep 1
done


# for transparent colors, get from xrdb, then add transparency
export BACKGROUND="$(xrdb -query | grep background | cut -f2)${BGOPACITY}"
export FOREGROUND="$(xrdb -query | grep foreground | cut -f2)${FGOPACITY}"

cat <<< "Foreground: $FOREGROUND"
cat <<< "Background: $BACKGROUND"

while IFS= read -r mon
do
    export MONITOR=$(cut -d':' -f1 <<< $mon)

    polybar --config=/home/katy/.config/polybar/config.ini dummy &
    polybar --config=/home/katy/.config/polybar/config.ini main &
done <<< $(polybar -m)





