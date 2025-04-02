# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL10K_MODE='nerdfont-complete'
# POWERLEVEL10K_PROMPT_ON_NEWLINE=true
# POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(prompt_char time)
# POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(context dir vcs status gcloud pyenv)
# POWERLEVEL10K_PROMPT_ADD_NEWLINE=true
# export VIRTUAL_ENV_DISABLE_PROMPT=''
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

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

EDITOR="fleet --wait"
KUBE_EDITOR="$EDITOR"
OTTO8_EDITOR="$EDITOR"
GOPATH="$HOME/go"
PATH="$HOME/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin"
MANPATH="/usr/local/man:$MANPATH"

PERL5LIB="/usr/local/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/usr/local/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/usr/local/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/usr/local/perl5"; export PERL_MM_OPT;
TERM=xterm-256color

eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

eval "$(direnv hook zsh)"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git copyfile brew droplr vscode pyenv)

# Setup homebrew autocomplete
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# User configuration
source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias py="python3"
alias piip="pip3"
alias java="java -cp ."
alias javac="javac -cp ."
alias kubectl="EDITOR=\"$EDITOR\" kubectl"
alias fw="fleet --wait"

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ol" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

# vi mode
set -o vi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function set_win_title() {
    local cmd=" ($@)"
    if [[ "$cmd" == " (starship_precmd)" || "$cmd" == " ()" ]]
    then
        cmd=""
    fi
    if [[ $PWD == $HOME ]]
    then
        if [[ $SSH_TTY ]]
        then
            echo -ne "\033]0; 🏛️ @ $HOSTNAME ~$cmd\a" </dev/null
        else
            echo -ne "\033]0; 🏠 ~$cmd\a" </dev/null
        fi
    else
        BASEPWD=$(basename "$PWD")
        if [[ $SSH_TTY ]]
        then
            echo -ne "\033]0; 🌩️ $BASEPWD @ $HOSTNAME $cmd\a" </dev/null
        else
            echo -ne "\033]0; 📁 $BASEPWD $cmd\a" </dev/null
        fi
    fi

}
precmd_functions+=(set_win_title)
export STARSHIP_CONFIG=$HOME/.starship.toml
eval "$(starship init zsh)"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/thedadams/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Added by Windsurf
export PATH="/Users/thedadams/.codeium/windsurf/bin:$PATH"
