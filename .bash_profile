# Use settings from ~/.bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# Add iraf setup commands
 if [ -e /home/linn/.iraf/setup.sh ]; then
     source /home/linn/.iraf/setup.sh
 fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/experimental:$PATH"
export PATH="$HOME/.local/bin/experimental/arch-thinkpad:$PATH"
export PATH="$HOME/.local/bin/statusbar/:$PATH"
export PATH="$HOME/.local/bin/voidrice/.local/bin/:$PATH"
export TEXMFHOME=/home/linn/.texmf/
export vi=/usr/bin/vim

