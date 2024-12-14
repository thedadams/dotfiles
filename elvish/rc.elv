use epm

epm:install &silent-if-installed github.com/zzamboni/elvish-modules

set E:HOMEBREW_PREFIX = /opt/homebrew
set E:HOMEBREW_CELLAR = /opt/homebrew/Cellar
set E:HOMEBREW_REPOSITORY = /opt/homebrew
set E:INFOPATH = /opt/homebrew/share/info
set E:PYENV_VIRTUALENV_INIT = 1
set E:STARSHIP_CONFIG = $E:HOME/.starship.toml
set E:TERM = xterm-256color
set E:EDITOR = "fleet --wait"
set E:KUBE_EDITOR = $E:EDITOR
set E:OTTO8_EDITOR = $E:EDITOR
set E:GOPATH = $E:HOME/go
set E:MANPATH = /usr/local/man

set paths = [
    $E:HOME/.rd/bin
    /opt/homebrew/Cellar/pyenv-virtualenv/1.2.4/shims
    /Users/thedadams/.pyenv/shims
    /opt/homebrew/Cellar/pyenv-virtualenv/1.2.4/shims
    $E:HOME/.pyenv/bin
    /opt/homebrew/bin
    /opt/homebrew/sbin
    $E:HOME/bin
    $E:HOME/.cargo/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    $E:HOME/go/bin
]

eval (starship init elvish)

## hook for direnv
set @edit:before-readline = $@edit:before-readline {
	try {
		var m = [("/opt/homebrew/bin/direnv" export elvish | from-json)]
		if (> (count $m) 0) {
			set m = (all $m)
			keys $m | each { |k|
				if $m[$k] {
					set-env $k $m[$k]
				} else {
					unset-env $k
				}
			}
		}
	} catch e {
		echo $e
	}
}

ssh-add --apple-use-keychain $E:HOME/.ssh/id_rsa

use github.com/zzamboni/elvish-modules/alias

alias:new bubu brew update; brew outdated; brew upgrade
alias:new fw fleet --wait