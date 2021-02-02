# Dotfiles

Scripts to setup my new computers. I go through new computers so often (and VM's too) I'm really tired of doing it over and over. I've been meaning to do this forever. It's finally time.

## Install/Update

Be sure to do this.

https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line

This is how I do it. Ok, I haven't done this yet, but it should mostly work the next time I do it, which should be soon. I'm sure when I actually do it I'll update this with fixes.

- Install OS
- Create admin account
- Create non-admin account
- Login as non-admin account
- Open Terminal and type

	cd
	git clone https://github.com/magnusviri/dotfiles.git
	cp .env.example .env
	nano .env

Edit stuff

	su admin_username
	cd
	ln -s ../non_admin_homedir/.env
	cd -
	./.dotfiles/install-new-computer.sh
	cd
	./.dotfiles/install-new-home-dir.sh
	exit
	cd
	./.dotfiles/install-new-home-dir.sh

## I should probably...

- Test this
- Add some branches for personal vs work computer.
- Add some branches for VM vs bare metal.
- Update the Linux stuff.
