# Aliases
alias g='cd $(ghq root)/$(ghq list | peco)'
alias ghub='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'%   

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
