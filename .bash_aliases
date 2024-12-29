# Setup color scheme <brokenman> for list call
alias ll='/bin/ls --color=auto -lF'
alias la='/bin/ls --color=auto -axF'
alias lt='\ls -lt | head '
#alias lsd='ls -d */'
alias lsd='ls --group-directories-first'

alias df='df -hT'
alias wget='wget -c'
alias gd='git diff'
alias ga='git add'
alias gp="git push"
alias gs='git status'
alias gsu='git status -uno'
alias gl='git log --graph --pretty=format:"%C(auto)%h%C(reset) %ad %C(auto)%d%C(reset) %s" --date=format:"%b %d, %Y"'
alias gcm='git commit -m '
# confirm before overwriting something
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkd="mkdir -pv"

alias sb='source ~/.bashrc'
alias cheat='cheat --all'
alias notes='cheat -p notes'
alias vi='nvim'
alias bm='bashmount'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias x='exit'
#alias t='trello-cmd'
alias t='tree -L'
alias pconf='sudo nvim /etc/pacman.conf'
alias pi='sudo pacman -Syy --needed --noconfirm'
alias lf='lfcd'
if command -v exa >/dev/null; then
    alias ls='exa-wrapper.sh'
fi
alias ytdl-short='yt-dlp -o "%(id)s.%(ext)s'
alias mem='BLOCK_BUTTON=1 memory'
alias lsblk='lsblk -o NAME,MAJ:MIN,RM,SIZE,RO,TYPE,MOUNTPOINTS,LABEL,UUID'
alias p='ping -c 10 google.com'
alias yta='yt-dlp --extract-audio --audio-format mp3'
alias sudox="sudo chmod u+x"
alias y='git --git-dir=/home/linn/.local/share/yadm/repo.git'
alias v='nvim'
alias vim='nvim'
alias l='ls'

# colorize commands
alias \
    ls="ls -hN --color=auto"\
    ip="ip -color=auto" \
    diff="diff --color=auto" \
    grep="grep --color=auto"

# frequently used programs
alias \
    g='git' \
    p='pacman'\
    py='python'
# ZSH aliases
alias zreloadkeys="killall sxhkd && sxhkd &!"
# use fzf for searching among non hidden files and cd to the base directory
alias fcd='cd $(find . .local -type f -not -path \*/.\* -print0 2>/dev/null | fzf --read0 | xargs -r -0 dirname)'

