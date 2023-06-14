# If you come from bash you might have to change your $PATH.
source "$HOME/.zsh_env"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

ZSH_CUSTOM="$HOME/.local/share/zsh-custom"

plugins=(
    aliases
    exa
    fast-syntax-highlighting
    fd
    git
    git-flow
    systemd
    zsh-autosuggestions
    zsh-bat
    ubuntu
)

source $ZSH/oh-my-zsh.sh

# Keybinds
bindkey '^ ' autosuggest-accept
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'ee' edit-command-line

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set personal aliases
alias gs="git status"
alias gpl="git pull"
alias fa="alias | fzf --border-label='Find Aliases' --prompt='Search > '"
alias gpoat="git push origin --all && git push origin --tags"
alias lg="lazygit"
alias fm="ranger"
alias c="code ."
alias tsu="sudo tailscale up --accept-routes"
alias tsd="sudo tailscale down"

# Php Dev Aliases
alias tinker="php artisan tinker"
alias artisan="php artisan"
alias a="php artisan"
alias xoff='sudo phpdismod -s cli xdebug'
alias xon='sudo phpenmod -s cli xdebug'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
