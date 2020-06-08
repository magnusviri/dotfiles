#!/bin/bash
set -u

echo "Run as an admin user. Authenticating as admin now."
sudo echo hi

# Brew

if [ ! -e "/usr/local/bin/brew" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# tmux

cd ~/
curl -O https://raw.githubusercontent.com/magnusviri/mysetup/master/.tmux.conf

# Textadept config

if [ ! -e ~/.textadept ]; then
  mkdir ~/.textadept
fi
cd ~/.textadept
curl -O https://raw.githubusercontent.com/magnusviri/mysetup/textadept/master/init.lua
curl -O https://raw.githubusercontent.com/magnusviri/mysetup/textadept/master/osx_env.sh

# Textadept Application

if [ ! -e /Applications/Textadept.app ]; then
  curl -O https://foicica.com/textadept/download/textadept_LATEST.osx.zip
  unzip textadept_LATEST.osx.zip
  rm textadept_LATEST.osx.zip
  sudo mv textadept*.osx/Textadept.app /Applications
  rm -r textadept*.osx
fi

if [ ! -e /usr/local/bin/textadept ]; then
  cd /usr/local/bin/
  sudo ln -s /Applications/Textadept.app/Contents/MacOS/textadept-curses textadept
fi

# textart
if [ ! -e /usr/local/bin/textart ]; then
  cd ~/
  curl -O https://raw.githubusercontent.com/magnusviri/textart/master/textart
  sudo cp textart /usr/local/bin/
  sudo chmod 755 /usr/local/bin/textart
  chmod 755 
fi

