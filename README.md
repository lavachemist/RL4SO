# Riot Launcher for SteamOS - sd card edition

## How to use it
<br/>
*Follow the video in the attribution section below with the following modifications:* <br/>

1) Create a folder on your sd card and place the League of Legends installer, the wine folder containing wine-ge-custom, and the LoL.sh script from this repo in that folder. <br/>
2) Under Preferences/Advanced, set Bottles to create new botttles in the folder you created in step one. <br/>

## How it works (a brief overview)
<br/>
`#!/bin/bash` tells the operating system that this is a Bash shell script. <br/>

`WINEPREFIX` is a variable that tells Wine where to find all of it's configuration files. <br/>

`${BASH_SOURCE%/*}` is the directory that the LoL.sh script is located in. <br/>

So, the script will tell Wine to look in the following locations: <br/>

1) A folder called LoL that is in the same directory as the LoL.sh: <br/>
`${BASH_SOURCE%/*}/LoL` <br/>

2) A folder, in the same directory, called wine that contains the Lutris release from the wine-ge-custom git: <br/>
`${BASH_SOURCE%/*}/wine/lutris-ge-lol-7.14-1-x86_64/bin/wine` <br/>

3) The drive_c folder that is automatically created in the LoL folder: <br/>
`${BASH_SOURCE%/*}/LoL/drive_c/Riot\ Games/Riot\ Client/RiotClientServices.exe` <br/>
NOTE: the backslash "\" is an escape character for bash. It's used here to tell Bash that the spaces in the Windows executable are part of the file name.

This should help you figure out how to install your bottle anwhere you want.

### Attribution:
- TheWereCat channel on YouTube, specifically this video and the bash script in the video description: https://www.youtube.com/watch?v=hNe3OLn9czE
- Wine-GE-Custom by GloriousEggRoll https://github.com/GloriousEggroll/wine-ge-custom
