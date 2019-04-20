#!/bin/bash
id=
devices=$(pactl list sink-inputs | grep -oP '(Sink Input #\K[^"]+)|(application.process.binary = "\K[^"]+)')
IFS=' ' read -r -a array <<< "$(echo $devices)"

# Iterate through our devices array to find spotify's Sink ID
i=0
for item in ${array[*]}; do
  if [[ "$item" == "spotify" ]]; then
    id=${array[$i-1]}
    echo "$id"
  fi
  i=$(($i + 1))
done

# Decreases the volume by 5%
if [[ $1 == "lower" ]]; then
  pactl set-sink-input-volume $id -5%
# Increases the volume by 5%
elif [[ $1 == "raise" ]]; then 
  pactl set-sink-input-volume $id +5%
# Sets the volume to 100%
elif [[ "$1" == "max" ]]; then
  pactl set-sink-input-volume $id 100%
# Sets the volume to 0%
elif [[ "$1" == "mute" ]]; then
	pactl set-sink-input-volume $id 0%
fi




