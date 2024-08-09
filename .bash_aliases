# Setup color scheme <brokenman> for list call
alias ll='/bin/ls --color=auto -lF'
alias la='/bin/ls --color=auto -axF'
alias l='ls'
alias lt='\ls -lt | head '
alias ld='ls -d */'
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
alias diff='diff --color=always'
alias sb='source ~/.bashrc'
alias cheat='cheat --all'
alias vi='vim'
alias bm='bashmount'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias x='exit'
alias t='trello-cmd'
alias pconf='sudo vim /etc/pacman.conf'
# confirm before overwriting something
alias pi='sudo pacman -S --noconfirm'
alias cp="cp -iv"
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkd="mkdir -pv" 
alias lf='lfub'
if command -v exa >/dev/null; then
    alias ls='exa-wrapper.sh'
else
    alias ls='/bin/ls $LS_OPTIONS'
fi
alias ytdl-short='yt-dlp -o "%(id)s.%(ext)s'
alias mem='BLOCK_BUTTON=1 memory'
