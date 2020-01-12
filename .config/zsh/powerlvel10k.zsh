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


# ▰▰▰ powerlevel10k config ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_TIME_ICON=''

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0BE'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\uE0BB'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\uE0BF'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"

POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='red'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'

POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="\UF017 %D{%I:%M  \UF133  %m.%d.%y}"

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{green}┌─%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{green}└─╼%f "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time  status)

source ~/powerlevel10k/powerlevel10k.zsh-theme

POWERLEVEL9K_FOLDER_ICON=' '
POWERLEVEL9K_HOME_ICON=" "
POWERLEVEL9K_HOME_SUB_ICON=" "
POWERLEVEL9K_EXECUTION_TIME_ICON=""
POWERLEVEL9K_OK_ICON=""
POWERLEVEL9K_FAIL_ICON=""
