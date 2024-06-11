# Aliases
source $ZDOTDIR/.aliases

# Completion
fpath+=($ZDOTDIR/completions)
autoload -Uz compinit
compinit -d "$HOME/.cache/.zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.cache/.zsh_history
HISTDUP=erase

setopt appendhistory \
	sharehistory \
	hist_ignore_space \
	hist_ignore_dups \
	hist_ignore_all_dups \
	hist_save_no_dups \
	hist_find_no_dups

# Autocd
setopt autocd

# Plugins
Plugins=(
	"/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	"/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
)

for plugin in ${Plugins[@]}
do
	[[ -e $plugin ]] && source $plugin
done

# Prompt
fpath+=($ZDOTDIR/pure)
PURE_PROMPT_SYMBOL="→"
autoload -U promptinit
promptinit
prompt pure
