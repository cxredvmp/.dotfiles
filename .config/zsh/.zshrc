# Aliases
[[ -r $ZDOTDIR/.aliases ]] && . "$ZDOTDIR/.aliases"

# Cache
[[ -d $HOME/.cache ]] || mkdir -p "$HOME/.cache"

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

setopt sharehistory \
	hist_ignore_space \
	hist_ignore_all_dups \
	hist_save_no_dups

# Autocd
setopt autocd

# Plugins
plugins=(
	"/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	"/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	"/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	"/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
)

for plugin in ${plugins[@]}
do
	[[ -e $plugin ]] && source $plugin
done

# Prompt
fpath+=($ZDOTDIR/pure)
PURE_PROMPT_SYMBOL="→"
autoload -U promptinit
promptinit
prompt pure
