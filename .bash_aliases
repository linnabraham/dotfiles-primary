# Setup color scheme <brokenman> for list call
alias ll='/bin/ls --color=auto -lF'
alias la='/bin/ls --color=auto -axF'
alias lt='\ls -lt | head '
#alias lsd='ls -d */'
alias lsd='ls --group-directories-first'
alias df='df -hT'
alias sudox="sudo chmod u+x"
alias p='ping -c 10 google.com'
alias wget='wget -c'
alias yta='yt-dlp --extract-audio --audio-format mp3'
alias gd='git diff'
alias gp="git push"
alias gs='git status'
alias gsu='git status -uno'
alias gl='git log --graph --pretty=format:"%C(auto)%h%C(reset) %ad %C(auto)%d%C(reset) %s" --date=format:"%b %d, %Y"'
alias sb='source ~/.bashrc'
alias cheat='cheat --all'
alias vi='vim'
alias bm='bashmount'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias x='exit'
alias t='trello-cmd'
alias pconf='sudo vim /etc/pacman.conf'
# confirm before overwriting something
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkd="mkdir -pv"
alias pi='sudo pacman -S --needed --noconfirm'
alias lf='lfub'
if command -v exa >/dev/null; then
    alias ls='exa-wrapper.sh'
fi
alias ytdl-short='yt-dlp -o "%(id)s.%(ext)s'
alias mem='BLOCK_BUTTON=1 memory'

# colorize commands
alias \
    ls="ls -hN --color=auto"\
    ip="ip -color=auto" \
    diff="diff --color=auto" \
    grep="grep --color=auto"

# frequently used programs
alias \
    g='git' \
    p='pacman'

# ZSH aliases
alias zreloadkeys="killall sxhkd && sxhkd &!"
