# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Miele settings:
export MIELE_SCRIPTS="$HOME/.local/bin"

# Default programs:
export EDITOR="nvim"
export VISUAL="code"
export TERMINAL="termite"
export BROWSER="brave"
export READER="zathura"
export FILE="ranger"
export STATUSBAR="polybar"
export WM="bspwm"

# ~/ Clean-up:
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs(eg: LightDM)
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# Other program settings:
export SUDO_ASKPASS="$MIELE_SCRIPTS/rofi/prompt-sudo-pass.sh"
export LESS=-R
# Set man/less colors:
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)   # begin bold
export LESS_TERMCAP_mb=$(tput bold; tput setaf 3)   # begin blink
export LESS_TERMCAP_me=$(tput sgr0)                 # reset bold/blink
export LESS_TERMCAP_so=$(tput rev; tput setaf 3)    # begin reverse video
export LESS_TERMCAP_se=$(tput sgr0)                 # reset reverse video
export LESS_TERMCAP_us=$(tput setaf 2)              # begin underline
export LESS_TERMCAP_ue=$(tput sgr0)                 # reset underline

#[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

# Load miele settings
. ~/.config/miele/mielerc

# Select compton config
if [ $COMPTON_BLUR = true ]; then
  ln -sf ~/.config/compton/compton-blur.conf ~/.config/compton.conf
else
  ln -sf ~/.config/compton/compton-no-blur.conf ~/.config/compton.conf
fi

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

