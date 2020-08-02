#!/bin/bash
set -u

# To run this script
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/magnusviri/dotfiles/master/.dotfiles/install-new-computer.sh)"

full_install=""
while [[ "$full_install" != "y" && "$full_install" != "n" ]]; do
	read -p 'Full install [y/n]?' full_install
done

echo "Authenticating as admin now."
sudo echo "I'm root now"

uname="$(uname)"

##########################################################################################

if	 [ ! -e /usr/local/bin/ ]; then
	echo "mkdir -p /usr/local/bin/"
	sudo mkdir -p /usr/local/bin/
	sudo chown root:wheel /usr/local/bin/
	sudo chmod 755 /usr/local/bin/
fi

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

# Micro
if [ ! -e /usr/local/bin/micro ]; then
	cd /usr/local/bin/
	sudo curl https://getmic.ro | bash
fi

if [[ "$full_install" == "y" ]]; then
	if [[ "$uname" == "Darwin" ]]; then

		brew install anaconda3
		brew install ansible
		# brew install autoconf # for radmind
		brew install cask
		brew install htop
		brew install mas
		brew install npm
		brew install packer
		brew install s3cmd
		brew install telnet
		brew install tmux
		brew install tree
		brew install wget
		# brew install speedtest-cli

		sudo easy_install pip

		mas install 508368068 # GetPlainText
		mas install 497799835 # Xcode
		#mas 662633568 # BlockheadsServer (1.7.1)
		#mas 409203825 # Numbers (10.0)
		#mas 409907375 # Remote Desktop (3.9)
		#mas 445770608 # Go2Shell --  version is 32-bit, download directly for 64-bit
		open "https://zipzapmac.com/Go2Shell"

		#cask "scribus"

		#radmind & atari 80, other emulators

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

	elif [[ "$uname" == "Linux" ]]; then
		if [ -e /bin/yum ]; then

			yum install tmux

		fi
		if [ -e /bin/apt ]; then

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
