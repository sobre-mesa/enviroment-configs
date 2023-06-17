#Theme
# ( modify "~/.oh-my-zsh/themes/bureau.zsh-theme" line 105 of 133
#to _USERNAME="⛩️  ")
ZSH_THEME="bureau"

#ZSH
export ZSH="$HOME/.oh-my-zsh" 
source $ZSH/oh-my-zsh.sh
source /Users/gargantuan_ape/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git zsh-autosuggestions)

#Startup Commands
cd /Users/gargantuan_ape/home
tree -L 2 --noreport

###################   | ALIASES | #####################

#System
alias ls="ls -1 --color"
alias brs="brew services list"
#Mongo
alias mongostart="brew services start mongodb-community@6.0"
alias mongostop="brew services stop mongodb-community@6.0"
#NPX
newredux(){
	npx degit reduxjs/redux-templates/packages/vite-template-redux $1
}

newreact(){
	npx create-react-app $1
}

newnext(){
    npx create-next-app
}

alias airbnb-lint="npm i eslint-config-airbnb"
