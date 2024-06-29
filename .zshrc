# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
# number of lines that are saved in memory
HISTSIZE=10000
# number of lines that are saved to file
SAVEHIST=500000
setopt autocd # Automatically cd into typed directory.
bindkey -v # enable vi mode
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/linn/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# BEGIN Copied from bashrc
export XDG_CONFIG_HOME="$HOME/.config"
[ -f $XDG_CONFIG_HOME/shortcutrc ] && source $XDG_CONFIG_HOME/shortcutrc

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [[ -f ~/.bashrc_scripts ]]; then
    source ~/.bashrc_scripts
fi
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
export EDITOR="/usr/bin/vim"

# END copied from bashrc
# BEGIN Lukesmiths changes
stty stop undef         # Disable ctrl-s to freeze terminal.
# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
# END Lukesmiths changes
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
ENABLE_CORRECTION="true"
#setopt CORRECT_ALL
setopt CORRECT


autoload -Uz add-zsh-hook

function xterm_title_precmd () {
        print -Pn -- '\e]2;%n@%m %~\a'
        [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
        print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
        [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*|st*) ]]; then
        add-zsh-hook -Uz precmd xterm_title_precmd
        add-zsh-hook -Uz preexec xterm_title_preexec
fi

#source $HOME/.local/bin/external/zbell.plugin.zsh # plugin to enable notification for long commands
export TEXMFHOME=/home/linn/.texmf/
export PATH="$PATH:$HOME/.virtualenvs/py37/bin" # append path in the beginning to not override default python

autoload -U colors && colors # load color support in prompt
autoload -Uz vcs_info # load version control info package
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true # tells the back-end to check for working-copy changes and staged changes.
zstyle ':vcs_info:git*' formats "%{$fg[red]%}%b%a%{$reset_color%}[%m%u%c]%{$reset_color%}"
#zstyle ':vcs_info:git*' formats "%b (%a) %m%u%c "
#### Changes to prompt ######
precmd() { vcs_info }

trunc_path(){
current_path=${${PWD}/#$HOME/"~"}
paths=(${(s:/:)${current_path//"~\/"/}})
local num=$(( ${#paths} - 1 ))
for (( i=1; i<$num; i++ )); do
paths[$i+1]=.
done
[[ $current_path != '~'* ]] && current_path="/" || current_path=""
current_path+="${(j:/:)paths}"
}

add-zsh-hook precmd trunc_path

# Embedd battery level inside prompt
battery_level=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage:" | awk '{print $2}')
update_battery_level(){
battery_level=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage:" | awk '{print $2}')
NEWLINE=$'\n'
PROMPT='%{$fg[green]%}%D{%I:%M}-[$battery_level%% ]%{$fg[blue]%}%n@%{$fg[blue]%}%M %{$fg[magenta]%}% ${current_path} ${vcs_info_msg_0_}${NEWLINE}>'
}
# Set up the prompt (with git branch name)

setopt PROMPT_SUBST
# Set up prompt with clock, battery level
#PROMPT='%{$fg[green]%}%D{%I:%M %p}[$battery_level%% ]%{$fg[blue]%}%n@%{$fg[blue]%}%M %{$fg[magenta]%}% ${current_path} ${vcs_info_msg_0_}> '
#PROMPT='%{$fg[green]%}%D{%I:%M}-[$battery_level%% ]%{$fg[blue]%}%n@%{$fg[blue]%}%M %{$fg[magenta]%}% ${current_path} ${vcs_info_msg_0_}>'
if [ -n "$ZSH_VERSION" ]; then
  autoload -U bashcompinit
  bashcompinit
fi

add-zsh-hook precmd update_battery_level
PROMPT+='
'
echo
##### Changes to prompt #####

#source $HOME/.scripts/tt.sh
#export PATH="$PATH:$HOME/.scripts"
python_venv() {
  #MYVENV=./helpers
  MYVENV=./.venv
  #FILE=requirements.txt
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $HOME/.virtualenvs/py37/bin/activate > /dev/null 2>&1
  #[[ -f "$FILE" ]] && source $HOME/.virtualenvs/py37/bin/activate > /dev/null 2>&1

  # when you cd into a folder that doesn't
  #[[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv
python_venv
#source ~/.scripts/virtualenvwrapper.plugin.zsh
export PATH="$HOME/.cargo/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/external/:$PATH"
#export PATH="$PATH:$HOME/.conda/envs/p36/bin/"
#export PATH="$PATH:$HOME/.conda/envs/p39/bin/"
#export PATH="$PATH:/opt/miniconda3/envs/default/bin/"
export PATH="$HOME/.local/bin/pip-packages/bin:$PATH"
source $HOME/.zsh_aliases
export HABITICA_TOKEN=87a1a0dd-5b8f-4b34-8336-55a56a0401ef
export HABITICA_UUID=ad875744-0b26-4f3d-af1b-ab54fade5d13
source $HOME/.local/bin/zbell.plugin.zsh

#export PYTHONPATH=$HOME/.local/bin/pip-packages/lib/python3.10/site-packages
#https://python.readthedocs.io/en/v2.7.2/using/cmdline.html#envvar-PYTHONNOUSERSITE
export PYTHONNOUSERSITE=1

export LS_OPTIONS="--color=auto"

# wrapper for cd when exiting lf ref - https://github.com/gokcehan/lf/blob/master/etc/lfcd.sh
lfcd () {
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
# bind lf to ctrl-o
bindkey -s '^o' 'lfcd\n'
bindkey '^R' history-incremental-search-backward
bindkey '[Z' autosuggest-accept  # bind ctrl+tab to accept the first autosuggestion
bindkey '^[[A' history-substring-search-up
#bindkey '^[[1;2C' history-substring-search-up
bindkey '^[[B' history-substring-search-down
#bindkey '^[[1;5D' history-substring-search-down

export PATH=$PATH:$HOME/work/nov2023/suitPipeline
export al1suit=$HOME/work/nov2023/suitPipeline/bash_scripts
export suitproduct=$HOME/work/nov2023/suitPipeline/myoutputs
export qldinfolder=$HOME/work/nov2023/suitPipeline/taroutput

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# change the different background coloring for directores which have o+w access
# to merely underline
export LS_COLORS="$LS_COLORS:ow=1;34;4:"
GPG_TTY=`tty`
export GPG_TTY
