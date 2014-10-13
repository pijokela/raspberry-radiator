#! /bin/bash
function addIfMissing {
  if [ "`grep $2 $1`" = "" ]; then
    echo Adding $2 to $1
    echo $2 >> $1
  else 
  	echo Not adding $2 to $1
  fi
}

function ensurePackage {
  sudo DEBIAN_FRONTEND=noninteractive apt-get -y install $1
}

addIfMissing /etc/X11/xinit/xinitrc "xset s off         # don't activate screensaver"
addIfMissing /etc/X11/xinit/xinitrc "xset -dpms         # disable DPMS (Energy Star) features."
addIfMissing /etc/X11/xinit/xinitrc "xset s noblank     # don't blank the video device"

ensurePackage git
ensurePackage wget
ensurePackage chromium

git clone 