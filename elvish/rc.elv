set E:HOMEBREW_PREFIX = /opt/homebrew
set E:HOMEBREW_CELLAR = /opt/homebrew/Cellar
set E:HOMEBREW_REPOSITORY = /opt/homebrew
set E:INFOPATH = /opt/homebrew/share/info
set E:PYENV_VIRTUALENV_INIT = 1
set E:STARSHIP_CONFIG = $E:HOME/.starship.toml
set E:TERM = xterm-256color
set E:EDITOR = "fleet --wait"
set E:KUBE_EDITOR = $E:EDITOR
set E:OBOT_EDITOR = $E:EDITOR
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

# hook for direnv
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

fn bubu {|@_| brew update; brew outdated; brew upgrade}
fn fw {|@a| fleet --wait $@a}

# Set the title to the current working directory.
use str

var start = "\e]0;"
var end = "\007"

fn set-title {|@title|
  var title-str = (str:join ' ' $title)
  print $start$title-str$end
}

var title-during-prompt = {
  put "elvish "(tilde-abbr $pwd)
}

set after-chdir = [ $@after-chdir {|dir|
    set-title ($title-during-prompt)
  } ]