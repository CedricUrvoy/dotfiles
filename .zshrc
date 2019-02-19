# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/cedricurvoy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export ZSH_THEME="agnoster"

DEFAULT_USER=$USER
# or
prompt_context() {}

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  dotenv
  osx
  yarn
  tmux
  npm
  docker
  node
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#aliases for mac
# for this one, it's needed to install macvim before
alias vim='/usr/local/Cellar/macvim/8.1-154/MacVim.app/Contents/MacOS/Vim'
# alias to run tmux with color
#alias tmux="TERM=screen-256color-bce tmux"
# git aliases
alias s='clear && git status'
alias ctags='`brew --prefix`/bin/ctags'
alias gocater='cd ~/Documents/GoCater'
alias jtags='ctags -R . && sed -i ‘’ -E ‘/^(if|switch|function|module\.exports|it|describe).+language:js$/d’ tags'
alias rgcontext='rg -B2 -A2 --color=always --follow --column --line-number'

alias lg='git lg'
alias co='git checkout $(git branch | fzf)'
alias cor='git checkout --track $(git branch -r | fzf)'
alias cod='git checkout develop'
alias ga='git add'
alias gp='git push'
alias gpu='git pull'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gm='git commit -m'
alias gc='git checkout'
alias git='hub'

export NVM_DIR="/Users/cedricurvoy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use 8.15.0
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"

ch() {
	local cols sep
	cols=$(( COLUMNS / 3 ))
	sep='{::}'

	cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

	sqlite3 -separator $sep /tmp/h \
		"select substr(title, 1, $cols), url
		from urls order by last_visit_time desc" |
	awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
	fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}
#export FZF_DEFAULT_COMMAND='if [ -f cscope.files ]; then cat cscope.files; else find ./ -type f ; fi'
#export FZF_DEFAULT_COMMAND='(
		#git ls-tree -r --name-only HEAD ||
		#find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//
	#) 2> /dev/null'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--preview="rougify -t nord {}"'
#bindkey '"\C-f": FZF_FILE=$(fzf) && [[ -e $FZF_FILE ]] && vim $FZF_FILE;'
#bindkey '"\C-e": FZF_FILE=$("rg" . | fzf -d: -n2 --preview="echo {} | cut -d: -f1 | xargs rougify -t monokai.sublime" | cut -d: -f1) && [[ -e $FZF_FILE ]] && vim $FZF_FILE;'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
