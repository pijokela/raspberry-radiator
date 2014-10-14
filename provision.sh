#! /bin/bash

# Set ROOT to empty if missing:
if [ -z "${ROOT+xxx}" ]; then
  ROOT=
fi

function cleanClone {
  GIT_DIR=$ROOT$HOME/git
  mkdir -p $GIT_DIR
  
  pushd $GIT_DIR
  rm -r $1
  git clone https://github.com/$1.git
  popd
}

function addIfMissing {
  if [ "`grep \"$2\" $1`" = "" ]; then
  	FILE=$ROOT$1
  	DIR=`dirname $FILE`
    echo Adding $2 to $FILE
    mkdir -p $DIR
    echo "$2" >> $FILE
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

cleanClone pijokela/raspberry-radiator