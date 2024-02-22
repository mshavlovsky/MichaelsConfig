# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.toolbox/bin/:$PATH:/opt/local/bin:/opt/local/sbin:/Users/shavlov/scripts:~/.toolbox/bin
# Path to your oh-my-zsh installation.
export ZSH=/Users/shavlov/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh
bindkey '^n' history-substring-search-up
bindkey '^e' history-substring-search-down
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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="/usr/bin/vim"

alias lat="pdflatex main.tex && open main.pdf"
alias nvi="nvim"

export ZSH_DISABLE_COMPFIX=true

export KEYTIMEOUT=1

#bindkey -v

bindkey '^n' history-substring-search-up
bindkey '^e' history-substring-search-down

##bindkey  -r 'i'
#bindkey -M vicmd 'i' vi-forward-char
#
## History search fix
#vi-cmd-up-line-history() {
#  zle vi-cmd-mode
#  zle history-substring-search-up
#}
#zle -N vi-cmd-up-line-history
#bindkey -M vicmd '^n' vi-cmd-up-line-history
#bindkey -M viins '^n' vi-cmd-up-line-history
#
#vi-cmd-down-line-history() {
#  zle vi-cmd-mode
#  zle history-substring-search-down
#}
#zle -N vi-cmd-down-line-history
#bindkey -M vicmd '^e' vi-cmd-down-line-history
#bindkey -M viins '^e' vi-cmd-down-line-history
#bindkey -M vicmd '^u' vi-change-whole-line
##bindkey -M vicmd 'dd' vi-change-whole-line
#bindkey -M viins '^u' vi-change-whole-line
#bindkey -M vicmd 'D' vi-change-eol

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/shavlov/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/shavlov/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/shavlov/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/shavlov/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

#mupdf () { mupdf-gl $1 >/dev/null 2>&1 & }

export PATH="/usr/local/opt/openssl/bin:$PATH"

alias emacs=/usr/local/bin/emacs
alias em="TERM=xterm /usr/local/bin/emacsclient -nw"
alias killemacsdaemon="emacsclient -e '(save-buffers-kill-emacs)'"
source ~/scripts/iterm2.zsh
alias emacsapp='open /usr/local/opt/emacs-mac/Emacs.app'
#==> Moving App 'Emacs.app' to '/Applications/Emacs.app'.
#==> Linking Binary 'Emacs' to '/usr/local/bin/emacs'.
#==> Linking Binary 'ebrowse' to '/usr/local/bin/ebrowse'.
#==> Linking Binary 'emacsclient' to '/usr/local/bin/emacsclient'.
#==> Linking Binary 'etags' to '/usr/local/bin/etags'.

# Uncomment for remote host, if want to start tmux session right away
#if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
#  tmux attach-session -t ssh_dev || tmux new-session -s ssh_dev
#fi

function mcurl() {
    /usr/bin/curl "$@" -L --cookie ~/.midway/cookie --cookie-jar ~/.midway/cookie
}
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
