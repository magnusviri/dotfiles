# When typing a dir alone, it will auto cd to the dir.
setopt AUTO_CD

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
setopt SHARE_HISTORY
# appeand to history
setopt APPEND_HISTORY
# appeat after every command
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

cat ~/.textart/*

alias ard='echo sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent'
alias icns2png='sips -s format png \!:1 --out \!:2'
alias extractAudio='ffmpeg -i \!:1 -vn -acodec copy \!:2'
alias pico='echo use nano or micro'

#export PS1="%n@%m:%d@%*$ "
export PS1="%F{white}<%F{yellow}%n%F{white}@%F{green}%m%F{white}:%F{magenta}%~%F{white}|%F{cyan}%F{white}%F{cyan}%*%F{white}>%f "
