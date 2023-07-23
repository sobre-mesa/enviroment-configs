#Tmux
if [ "$TMUX" = "" ]; then tmux; fi
alias tmk="tmux kill-server" 
alias tls="tmux ls"

#ZSH
ZSH_THEME="agnoster"
export ZSH="$HOME/.oh-my-zsh" 
source $ZSH/oh-my-zsh.sh
source /Users/gargantuan_ape/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(git zsh-autosuggestions)
export LC_ALL=en_US.UTF-8

alias zrl="omz reload"
alias zrc="nvim ~/.zshrc"

#Startup Commands
cd /Users/gargantuan_ape/home

#System
alias ls="ls -1 --color"
alias brs="brew services list"
alias tmc="vim ~/.conf/tmux/tmux.conf"
alias nv="nvim ."
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;35'
NC='\033[0m' # No Color

#Mongo
alias mongostart="brew services start mongodb-community@6.0"
alias mongostop="brew services stop mongodb-community@6.0"

#NPX
alias newredux="npx degit reduxjs/redux-templates/packages/vite-template-redux"
alias newreact="npx create-react-app"
alias newNext="npx create-next-app"

#GIT
alias b="git checkout"
alias bb="git checkout -"
alias bdev="git checkout develop"
alias sq="git rebase -i --root"
alias sd="git fetch origin develop:develop && git rebase -i develop"
alias devrb="git fetch origin develop:develop && git rebase develop && git status"

#git adds all files, commits with message, and pushes
gc(){ #opens function
	git add . #git adds all files
	git commit -m $1 #git commits with message
} #closes function
#clean code

nuke(){
    branch_name=$(git branch --show-current)	
    echo "💣 💣💣  ${RED}Destroy all${NC} local changes ? [${GREEN}y${NC}/${RED}N${NC}]💣💣💣"
	read response </dev/tty
	case "$response" in
	    [yY][eE][sS]|[yY]) 
		echo "🔥💥🔥🔥💥🔥🔥💥🔥🔥💥🔥🔥💥🔥🔥💥🔥"
		git add .
		git stash
		echo "" 
		echo " 🫥"
		git reset --hard "origin/${branch_name}" 
		echo "$(git status)"
		echo "🔥💥🔥🔥💥🔥🔥💥🔥🔥💥🔥🔥💥🔥🔥💥🔥"
	     	;;
 		*)
		echo "🏃💣"
 		;;
	esac
}

#The XXXXXX Development Suite 1.0
alias mms="cd ~/home/XXXXXX/mms-frontend"
alias mmsui="cd ~/home/XXXXXX/mms-ui-components"
alias vmms="nvim ~/home/XXXXXX/mms-frontend"
alias vmmsui="nvim ~/home/XXXXXX/mms-ui-components"
#Extracts Ticket Number From Current Branch
t_num(){
	branch_name=$(git branch --show-current)	
	#Remove feature/ bugfix/ etc
	prefix_removed="${branch_name#*/}"

	# Gets Prefix, ex: MMS2 
	prefix="${prefix_removed%%-*}"
	#Gets Ticket all numbers, then removes the first one that comes from MMS2
	number=$(echo "$prefix_removed" | grep -oE '[0-9]+')
	number=${number:1}
	#MMS-????
	ticket_number="$prefix-$number"	
	ticket_number=${ticket_number//$'\n'/}
	echo "$ticket_number"
}
#Commits with t_num of current branch prefixing to pass pre-commit
hc(){
	git add .
	echo "📝 Added changes: "
	git status
	ticket_number=$(t_num)
	commit_msg=$1
	
	if [ -z "$commit_msg" ]; then
		echo "Need a message"
		return 1
	fi
	
	m="$ticket_number: $commit_msg"
	echo "📦 Committing: $m ... 📦"
	command git commit -m "$m"
}

local-mmsui(){
	cd ~/home/XXXXXX/mms-ui-components
	branch_name=$(git branch --show-current)	
	echo "📦 Building ${RED}@mms/ui${NC}:${GREEN}${branch_name}${NC} in ${RED}/mms-ui-components/temp/${NC} and applying to ${CYAN}mms-frontend${NC}/${GREEN}package.json${NC}"
	dest="~/home/XXXXXX/mms-frontend"
	npm run pack:local --dest=${dest}
	cd ~/home/XXXXXX/mms-frontend
	echo "🔍 Added to package: "
	echo "${GREEN}$(cat package.json | grep -n "@mms/ui")${NC}"
}
alias reset-mmsui="git checkout origin/develop -- ~/home/XXXXXX/mms-frontend/package.json"

ship(){
	echo "🛳️ Pushing $(t_num) 🌊"
	git push
}

pr() {
	NPM_TOKEN="zxji_HUzpQkzBFyXhSRP"
	GITLAB="https://gitlab.accessXXXXXX.com/"
	BRANCH=$(git branch --show-current)	
	header=$(echo "PRIVATE-TOKEN: ${NPM_TOKEN}") 
        url=$(echo "${GITLAB}api/v4/projects/9/merge_requests?source_branch=${BRANCH}")
	PR_NUMBER=$(echo "$(curl --header ${header} ${url} | jq -r '.[].iid') ")
	echo "${PR_NUMBER}"
        open -a "Google Chrome" "${GITLAB}/mms2/mms-frontend/-/merge_requests/${PR_NUMBER%?}" 
}

jira(){
	n=$(t_num)
	echo "🔷 Jumping to Ticket: ${n} 🔷"
	jira="https://XXXXXX-enviro.atlassian.net/browse/${n}"	
	open -a "Google Chrome" ${jira}
}

mmsrepo(){
	x=$(echo "https://gitlab.accessXXXXXX.com/mms2/mms-frontend")
	echo "🦊 ${x}"
	open -a "Google Chrome" ${x}
}

uirepo(){
	x=$(echo "https://gitlab.accessXXXXXX.com/mms2/mms-ui-components")
	echo "🦊 ${x}"
	open -a "Google Chrome" ${x}
}

tcity(){
	x=$(echo "https://teamcity.accessXXXXXX.com/favorite/projects")
	echo "🏙️ ${x}"
	open -a "Google Chrome" ${x}
}

swag(){
	x=$(echo "https://mms2-api-dev.accessXXXXXX.com/swagger/index.html")
	echo "❇️  ${x}"
	open -a "Google Chrome" ${x}
}

addmenu(){
	menu=http://localhost:3000/configurations/menu
	conf=https://XXXXXX-enviro.atlassian.net/wiki/spaces/MMS2/pages/2130346236/Menus+Management
	open -a "Google Chrome" ${menu}
	open -a "Google Chrome" ${conf}
}

plz(){
	NPM_TOKEN="XXXXX"
	GITLAB="https://gitlab.accessXXXXXX.com/"
	BRANCH=$(git branch --show-current)	
	header=$(echo "PRIVATE-TOKEN: ${NPM_TOKEN}") 
    url=$(echo "${GITLAB}api/v4/projects/9/merge_requests?source_branch=${BRANCH}")
	PR_NUMBER=$(echo "$(curl --header ${header} ${url} | jq -r '.[].iid') ")
	echo "${PR_NUMBER}"
	plz=$(echo "👋 Can I get a review on: ${GITLAB}/mms2/mms-frontend/-/merge_requests/${PR_NUMBER%?}, please?")
	echo $plz
	echo $plz | pbcopy
	open -a "Microsoft Teams"
}


plz-re(){
	NPM_TOKEN="XXXXX"
	GITLAB="https://gitlab.accessXXXXXX.com/"
	BRANCH=$(git branch --show-current)	
	header=$(echo "PRIVATE-TOKEN: ${NPM_TOKEN}") 
    url=$(echo "${GITLAB}api/v4/projects/9/merge_requests?source_branch=${BRANCH}")
	PR_NUMBER=$(echo "$(curl --header ${header} ${url} | jq -r '.[].iid') ")
	echo "${PR_NUMBER}"
	plz=$(echo "${GITLAB}/mms2/mms-frontend/-/merge_requests/${PR_NUMBER%?} needs a re-review, please")
	echo $plz
	echo $plz | pbcopy
	open -a "Microsoft Teams"
}
