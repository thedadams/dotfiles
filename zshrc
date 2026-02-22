EDITOR="nvim"
KUBE_EDITOR="$EDITOR"
GOPATH="$HOME/go"
PATH="$HOME/bin:$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin"
MANPATH="/usr/local/man:$MANPATH"

PERL5LIB="/usr/local/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/usr/local/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/usr/local/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/usr/local/perl5"; export PERL_MM_OPT;
TERM=xterm-256color

# The shellenv commands for homebrew are different
# based on mac and linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# pyenv config
if type pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi

if type direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# Setup homebrew autocomplete
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

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

alias bubu="brew update; brew outdated; brew upgrade"
alias py="python3"
alias piip="pip3"
alias java="java -cp ."
alias javac="javac -cp ."
alias kubectl="EDITOR=\"$EDITOR\" kubectl"
alias jj="JJ_EDITOR=\"$EDITOR\" jj"
alias zw="zed --wait"

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

precmd_functions+=(set_win_title)

ssh-add --apple-use-keychain $HOME/.ssh/id_rsa

fpath=($HOME/.nix-profile/share/zsh/site-functions $fpath)

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    PATH=$PATH:/nix/var/nix/profiles/default/bin
fi
# End Nix

alias claude="/Users/thedadams/.claude/local/claude"
export PATH="$HOME/.local/bin:$PATH"
