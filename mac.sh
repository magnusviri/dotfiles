#!/bin/bash
set -u

if [ ! -e "/usr/local/bin/brew" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

cd ~/
curl -O https://raw.githubusercontent.com/magnusviri/mysetup/master/.tmux.conf

if [ ! -e ~/.textadept ]; then
  mkdir ~/.textadept
fi

cd ~/.textadept
curl -O https://raw.githubusercontent.com/magnusviri/mysetup/textadept/master/init.lua
curl -O https://raw.githubusercontent.com/magnusviri/mysetup/textadept/master/osx_env.sh
curl -O https://foicica.com/textadept/download/textadept_LATEST.osx.zip
unzip textadept_LATEST.osx.zip


cd /usr/local/bin/
sudo ln -s /Applications/Textadept.app/Contents/MacOS/textadept-curses ta
