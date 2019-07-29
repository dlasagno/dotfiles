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


# ▰▰▰ load wal ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

#(cat ~/.cache/wal/sequences &)


# ▰▰▰ set man/less colors ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

export LESS_TERMCAP_md=$(tput bold; tput setaf 1)   # begin bold
export LESS_TERMCAP_mb=$(tput bold; tput setaf 3)   # begin blink
export LESS_TERMCAP_me=$(tput sgr0)                 # reset bold/blink
export LESS_TERMCAP_so=$(tput rev; tput setaf 3)    # begin reverse video
export LESS_TERMCAP_se=$(tput sgr0)                 # reset reverse video
export LESS_TERMCAP_us=$(tput setaf 2)              # begin underline
export LESS_TERMCAP_ue=$(tput sgr0)                 # reset underline
