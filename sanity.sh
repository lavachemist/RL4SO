#!/bin/bash

thisdir=$(pwd)
lolscript=LoL.sh
lolexe=(Install\ League\ of\ Legends\ *)
lutrisfolder=lutris-ge-lol-7.14-1-x86_64
sddir=/run/media

# check if stuff exists where it's supposed to
if [[ ! -f $thisdir/$lolscript ]]
  then
    echo "LoL.sh not found"
fi

# launch the downloader script if LoL installer is AWOL
if [[ ! -f $thisdir/$lolexe ]]
  then
    echo "LoL installer not found, opening a link so you can download it"
    /bin/bash $thisdir/downloader.sh
fi

# create the LoL folder, if it doesn't exist
if [[ ! -d $thisdir/LoL ]]
  then
    echo "LoL folder is missing, creating it now"
    mkdir $thisdir/LoL
fi

# create the wine folder, if it doesn't exist
if [[ ! -d $thisdir/wine ]]
  then
    echo "wine folder is missing, creating it now"
    mkdir $thisdir/wine
fi

# get lutris-ge-lol if it doesn't exist
if [[ ! -d $thisdir/wine/$lutrisfolder ]]
  then
    echo "lutris-ge-lol is missing, pulling it down now"
    cd wine
    wget https://github.com/GloriousEggroll/wine-ge-custom/releases/download/7.14-GE-1-LoL/wine-lutris-ge-lol-7.14-1-x86_64.tar.xz
    tar -xvf wine-lutris-ge-lol-7.14-1-x86_64.tar.xz
fi

exit 0