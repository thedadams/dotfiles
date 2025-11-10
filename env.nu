# env.nu
#
# Installed by:
# version = "0.108.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
use std/util "path add"

$env.EDITOR = "zed -w"

$env.GOPATH = ($env.HOME | path join "go")

path add "/opt/homebrew/bin"
path add "~/bin"
path add "~/.cargo/bin"
path add "/usr/local/bin"
path add "/usr/local/sbin"
path add "/usr/bin:/bin"
path add "/usr/sbin"
path add "/sbin"
path add ($env.GOPATH | path join "bin")

$env.config.edit_mode = 'vi'
