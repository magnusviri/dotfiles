# This runs after .zshenv

cat "${HOME}/.textart/"*

source ~/.bash_profile

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
setopt SHARE_HISTORY
# appeand to history
setopt APPEND_HISTORY
# append after every command
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Silences "zsh: sure you want to delete all n files in /... [yn]?"
setopt rmstarsilent

# When typing a dir alone, it will auto cd to the dir.
setopt AUTO_CD

# Makes esc-del work right
WORDCHARS='~!#$%^&*(){}[]<>?.+;-'

# Prompt
#export PS1="%n@%m:%d@%*$ "
export PS1="%F{white}<%F{yellow}%n%F{white}@%F{green}%m%F{white}:%F{magenta}%~%F{white}|%F{cyan}%F{white}%F{cyan}%*%F{white}>%f "

########
# My customizations

nvm use v14.15.1

alias npm6="nvm use v14.15.1"
alias ard='echo sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent'
alias icns2png='sips -s format png \!:1 --out \!:2'
alias extractAudio='ffmpeg -i \!:1 -vn -acodec copy \!:2'
alias nano='micro'
alias pico='micro'
alias ping='prettyping'
alias 'cat'='bat'
alias curl='http'
alias man='tldr'
alias top='glances'

export PATH="/usr/local/sbin:$PATH"

########
# 3rd party

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

source /usr/local/vic/autocomplete/zsh/vic-machine-darwin

########
# Adobe will never be my cloud storage...

rmdir "${HOME}/Creative Cloud Files"
rmdir "${HOME}/Creative Cloud Files/Icon$'\r'"
