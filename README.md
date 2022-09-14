# Riot Launcher for SteamOS - sd card edition

## Follow the video in the attribution section below with the following modifications:

1) Create a folder on your sd card and place the League of Legends installer, the wine folder containing wine-ge-custom, and the LoL.sh script from this repo in that folder.
2) Under Preferences/Advanced, set Bottles to create new botttles in the folder you created in step one.

## How it works (a brief overview)

`WINEPREFIX` is a variable that tells Wine where to find all of it's configuration files. 

`${BASH_SOURCE%/*}` is the directory that the LoL.sh script is located in.

So, the script will tell Wine to look in the following locations:

1) A folder called LoL that is in the same directory as the LoL.sh:
`${BASH_SOURCE%/*}/LoL`

2) A folder, in the same directory, called wine that contains the Lutris release from the wine-ge-custom git:
`${BASH_SOURCE%/*}/wine/lutris-ge-lol-7.14-1-x86_64/bin/wine`

3) The drive_c folder that is automatically created in the LoL folder:
`${BASH_SOURCE%/*}/LoL/drive_c/Riot\ Games/Riot\ Client/RiotClientServices.exe`

This should help you figure out how to install your bottle anwhere you want.

### Attribution:
- TheWereCat channel on YouTube, specifically this video and the bash script in the video description: https://www.youtube.com/watch?v=hNe3OLn9czE
- Wine-GE-Custom by GloriousEggRoll https://github.com/GloriousEggroll/wine-ge-custom
