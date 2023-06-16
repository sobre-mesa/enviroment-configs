export ZSH="$HOME/.oh-my-zsh" 
ZSH_THEME="bureau"
#modify "~/.oh-my-zsh/themes/bureau.zsh-theme" line 105 of 133
#to _USERNAME="⛩️  "
source $ZSH/oh-my-zsh.sh

plugins=(git zsh-autosuggestions)


source /Users/gargantuan_ape/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

cd /Users/gargantuan_ape/home

tree -L 2 --noreport
alias ls="ls -1 --color"
