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


# ▰▰▰ initialize autocpmpletion ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰
autoload -Uz compinit
mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# ▰▰▰ autocpmpletion styles ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰

# Use menu completion
zstyle ':completion:*' menu select

# Verbose completion results
zstyle ':completion:*' verbose true

# Case insensitive completition
# Smart matching of dashed values, e.g. f-b matching foo-bar
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z} r:|[._-]=* r:|=*'

# Group results by category
zstyle ':completion:*' group-name ''

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# Don't try parent path completion if the directories exist
zstyle ':completion:*' accept-exact-dirs true

# Always use menu selection for `cd -`
zstyle ':completion:*:*:cd:*:directory-stack' force-list always
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# Pretty messages during pagination
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Nicer format for completion messages
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:corrections' format '%U%F{green}%d (errors: %e)%f%u'
zstyle ':completion:*:warnings' format '%F{202}%BSorry, no matches for: %F{214}%d%b'

# Prettier completion for processes
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,args -w -w"

# Use ls-colors for path completions
function _set-list-colors() {
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
	unfunction _set-list-colors
}
sched 0 _set-list-colors # deferred since LC_COLORS might not be available yet
