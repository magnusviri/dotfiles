#!/bin/bash
set -u

echo "This script should be idempotent and can be run over and over"

# To run this script
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/magnusviri/dotfiles/master/.dotfiles/install-new-computer.sh)"

full_install=""
while [[ "$full_install" != "y" && "$full_install" != "n" ]]; do
	read -p 'Full install [y/n]?' full_install
done

echo "Authenticating as admin now."
sudo echo "I'm root now"

##########################################################################################

uname="$(uname)"

##########################################################################################

if	 [ ! -e /usr/local/bin/ ]; then
	echo "mkdir -p /usr/local/bin/"
	sudo mkdir -p /usr/local/bin/
	sudo chown root:wheel /usr/local/bin/
	sudo chmod 755 /usr/local/bin/
fi

# Micro
if [ ! -e /usr/local/bin/micro ]; then
	cd /usr/local/bin/
	sudo curl https://getmic.ro | bash
fi

if [[ "$uname" == "Darwin" ]]; then

	if [ ! -e /usr/local/bin/mak.py ]; then
		echo "curl -o /usr/local/bin/mak.py https://raw.githubusercontent.com/magnusviri/mak.py/master/mak.py"
		sudo curl -o /usr/local/bin/mak.py https://raw.githubusercontent.com/magnusviri/mak.py/master/mak.py
		sudo chown root:wheel /usr/local/bin/mak.py
		sudo chmod 755 /usr/local/bin/mak.py
	fi

	# Brew
	if test ! $(which brew); then
		echo "Installing Homebrew"
		if test "$uname" = "Darwin"; then
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		elif test "$uname" = "Linux"; then
			echo "Do I want brew on Linux?"
		fi
	fi

	if [[ "$full_install" == "y" ]]; then

		brew_formulae='
			tap "homebrew/bundle"
			tap "homebrew/cask"
			tap "homebrew/core"

			brew "angular-cli"
			brew "ansible"
			brew "asciinema"
			brew "bat"
			brew "catimg"
			brew "ffmpeg"
			brew "glances" # top, disk io, net, etc
			brew "htop"
			brew "httpie" # a user-friendly command-line HTTP client for the API era. https://httpie.org/
			brew "imagemagick"
			brew "lolcat"
			brew "lua"
			brew "mas"
			brew "micro"
			brew "minetest"
			brew "neofetch" # system_profiler like
			brew "nnn" # File browser
			brew "prettier"
			brew "prettyping"
			brew "python3"
			brew "socat"
			brew "svg2png"
			brew "telnet"
			brew "tldr"
			brew "tmux"
			brew "webp"
			brew "wget"
			brew "whalebrew"
			brew "wumpus"
			brew "youtube-dl"
			brew "zsh"

# 			brew "autoconf" # for radmind
# 			brew "duti"
# 			brew "freeciv"
# 			brew "gifsicle" # Manipulate GIFs from terminal
# 			brew "gnu-typist" # Term typing tutor
# 			brew "jq" # like sed for JSON datahttps://stedolan.github.io/jq/
# 			brew "klavaro" # GUI typing tutor
# 			brew "librsvg"
# 			brew "mariadb"
# 			brew "midnight-commander" # Terminal Finder
# 			brew "packer"
# 			brew "pacman4console"
# 			brew "s3cmd"
# 			brew "speedtest-cli"
# 			brew "tesseract" #OCR software
# 			brew "trader" # Old game
# 			brew "tree" # displays directories as trees
# 			brew "tty-solitaire"

			cask "anaconda"
			cask "bbedit"
			cask "blender"
			cask "brave-browser"
			cask "cord"
			cask "docker"
			cask "dropbox"
			cask "firefox"
			cask "freeorion"
			cask "go2shell"
			cask "grandperspective"
			cask "inkscape" # used for svg2icns
			cask "iterm2"
			cask "suspicious-package"
			cask "textadept"
			cask "vagrant"
			cask "vlc"
			cask "vscodium"
			cask "wireshark"
			cask "xquartz"
			cask "zenmap"
			cask "zoom"

#			cask "microsoft-office"

# 			cask "mame" #
# 			cask "milkytracker" #
# 			cask "musescore" #
# 			cask "nestopia" #
# 			cask "openaudible" #
# 			cask "scribus" #
# 			cask "virtualc64" #

			mas "1Password 7", id: 1333542190
			mas "com.alice.mac.GetPlainText", id: 508368068
			mas "GarageBand", id: 682658836
			mas "Keynote", id: 409183694
			mas "Numbers", id: 409203825
			mas "Remote Desktop", id: 409907375
			mas "Slack", id: 803453959
			mas "The Unarchiver", id: 425424353
			mas "VOX", id: 461369673
			mas "Xcode", id: 497799835

# 			mas "BlockheadsServer", id: 662633568
#			mas "WiFi Explorer Lite", id: 1408727408
'

		echo "$brew_formulae" | brew bundle install --file=-

# If 10.15
#			cask "vmware-fusion"

#Box
#extFS for Mac
#VirtualBox
#radmind & atari 80, other emulators
#MountainDuck

		brew cleanup
		brew doctor --verbose

		grep /usr/local/bin/zsh /etc/shells
		if [[ -e "/usr/local/bin/zsh" && "$?" == 1 ]]; then
			echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
		fi

		sudo easy_install pip

		if [ ! -e /usr/local/bin/svg2icns ]; then
			curl -o /usr/local/bin/svg2icns https://raw.githubusercontent.com/magnusviri/svg2icns/main/svg2icns
			chmod 755 /usr/local/bin/svg2icns
		fi

#		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

		# Hosts

		# TextAdept
# 		if [ ! -e /Applications/Textadept.app ]; then
# 			cd ~/
# 			curl -O https://foicica.com/textadept/download/textadept_LATEST.osx.zip
# 			unzip textadept_LATEST.osx.zip
# 			rm textadept_LATEST.osx.zip
# 			sudo mv textadept*.osx/Textadept.app /Applications
# 			rm -r textadept*.osx
# 		fi
# 		if [ ! -e /usr/local/bin/textadept ]; then
# 			cd /usr/local/bin/
# 			sudo ln -s /Applications/Textadept.app/Contents/MacOS/textadept-curses textadept
# 		fi

		sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

		#Remote Desktop grant non-admin rights, and remote desktop remote usage

		# textart
		if [ ! -e /usr/local/bin/textart ]; then
			sudo curl -o /usr/local/bin//textart https://raw.githubusercontent.com/magnusviri/textart/master/textart
			sudo chown root:wheel /usr/local/bin/textart
			sudo chmod 755 /usr/local/bin/textart
		fi

		# sudo cpan install Spreadsheet::ParseExcel

		echo "Set iTerm2 to default and ls -al to command."
		echo "Fix iTerm2's home, end, page up, page down, cmd-arrow keys."

	fi

elif [[ "$uname" == "Linux" ]]; then

	# Dropbox
	#https://www.dropbox.com/install-linux
	#cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

	#https://help.dropbox.com/installs-integrations/desktop/linux-commands
	#deb https://linux.dropbox.com/ubuntu xenial main >> /etc/apt/sources.list
	#sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

	if [ ! -e /usr/local/bin [; then
		sudo mkdir -p /usr/local/bin
	fi

	if [ -e /bin/yum ]; then

		yum -y update && yum -y upgrade
		yum -y install open-vm-tools
		yum -y install git
		yum -y install tmux
		yum -y install rsync
		#yum -y install nano
		#yum -y install nftables

	elif [ -e /bin/apt ]; then

		sudo apt install tmux
		sudo apt install snapd
		sudo snap install brave
		sudo apt install curl
		sudo apt install apt-transport-https
		curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
		curl https://s3-us-west-2.amazonaws.com/brave-apt/keys.asc | sudo apt-key add -
		source /etc/os-release
		echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee
		/etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
		sudo apt update

	fi
fi

# https://docs.brew.sh/Adding-Software-to-Homebrew
# https://github.com/Homebrew/homebrew-core/blob/master/Formula/ansible.rb
# https://github.com/nicknisi/dotfiles/blob/master/Brewfile
# https://medium.com/better-programming/12-terminal-tips-and-tricks-using-macos-and-homebrew-4e89c2ccb2fb
#
# https://github.com/nicknisi/dotfiles/tree/master/zsh
# https://github.com/skwp/dotfiles/blob/master/tmux/tmux.conf
# https://github.com/ryanb/dotfiles/blob/master/oh-my-zsh/custom/plugins/rbates/bin/tagversions
# https://github.com/thoughtbot/dotfiles/blob/master/tmux.conf
# https://github.com/holman/dotfiles/blob/master/homebrew/install.sh
# https://github.com/holman/dotfiles/blob/master/zsh/config.zsh
# https://github.com/search?q=zsh+dotfiles&ref=commandbar
# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
