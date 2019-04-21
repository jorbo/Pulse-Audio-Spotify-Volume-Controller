# Pulse Audio Spotify Volume Controller

Really simple script that allows you to change the volume of Spotify via PulseAudio. This is a workaround for being unable to control Spotify via mpris(playerctl) because they suck.

I currently have this script bound to an i3 keybind:  
`bindsym $mod+minus exec pulse.sh lower`  
`bindsym $mod+plus exec pulse.sh raise`  


## How to use

The script takes only 1 argument.

`pulse.sh lower`
Lowers the volume by 5%

`pulse.sh raise`
Raises the volume by 5%

`pulse.sh max`
Sets the volume to 100%

`pulse.sh mute`
Sets the volume to 0%
