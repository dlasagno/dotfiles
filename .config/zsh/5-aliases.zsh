#       ___          ___          ___          ___          ___     
#      /\__\        /\__\        /\  \        /\  \        /\__\    
#     /::|  |      /:/ _/_       \:\  \      /::\  \      /:/  /    
#    /:/:|  |     /:/ /\  \       \:\  \    /:/\:\__\    /:/  /     
#   /:/|:|  |__  /:/ /::\  \  ___ /::\  \  /:/ /:/  /   /:/  /  ___ 
#  /:/ |:| /\__\/:/_/:/\:\__\/\  /:/\:\__\/:/_/:/__/___/:/__/  /\__\
#  \/__|:|/:/  /\:\/:/ /:/  /\:\/:/  \/__/\:\/:::::/  /\:\  \ /:/  /
#      |:/:/  /  \::/ /:/  /  \::/__/      \::/~~/~~~~  \:\  /:/  / 
#      |::/  /    \/_/:/  /    \:\  \       \:\~~\       \:\/:/  /  
#      |:/  /       /:/  /      \:\__\       \:\__\       \::/  /   
#      |/__/        \/__/        \/__/        \/__/        \/__/    


# ▰▰▰ aliases ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
alias ls="ls -hF --color=auto"
alias ll="ls -lahF --color=auto"
alias mkdir="mkdir -p"
alias grep="grep -i"
alias cp="cp -r"
alias scp="scp -r"
alias figlet="figlet -f isometric2 -w 128"
alias e="$EDITOR"
alias se="sudo $EDITOR"
alias ag="ag --color --color-line-number '0;35' --color-match '46;30' --color-path '4;36'"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias supacman="sudo pacman"
alias susystemctl="sudo systemctl"
alias :q="sudo systemctl poweroff"
alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h;'

# dotfiles git
alias dots-git="git --git-dir=$HOME/dotfiles-git --work-tree=$HOME"

# ▰▰▰ functions ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
wal-gif() {
    killall back4.sh
    rm -rf /tmp/back4
    wal -n -i "$@"
    ./scripts/back4.sh 0.020 "$(< "${HOME}/.cache/wal/wal")" &
}
