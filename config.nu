# config.nu
#
# Installed by:
# version = "0.108.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R


$env.config = ($env.config | upsert edit_mode vi | upsert cursor_shape { vi_insert: line, vi_normal: block, emacs: block })

def bubu [] {
    brew update
    brew outdated
    brew upgrade -y
}

def --env unsource-env [file: path] {
  let text = (open --raw $file)

  # Find direct assignments:
  # $env.FOO = ...
  # $env.'FOO' = ...
  # $env."FOO" = ...
  let direct = (
      [
          ($text
              | parse --regex r#'(?m)(?:^|[;|{])\s*\$env\.(?<name>[A-Za-z_][A-Za-z0-9_]*)\s*(?:\+{1,2}=|=(?:\s|[^=]))'#
              | get name)
          ($text
              | parse --regex r#'(?m)(?:^|[;|{])\s*\$env\.'(?<name>[^']+)'\s*(?:\+{1,2}=|=(?:\s|[^=]))'#
              | get name)
          ($text
              | parse --regex r#'(?m)(?:^|[;|{])\s*\$env\."(?<name>[^"]+)"\s*(?:\+{1,2}=|=(?:\s|[^=]))'#
              | get name)
      ]
      | flatten
  )

  # Find keys in simple load-env { ... } records.
  let loaded = (
      $text
      | lines
      | reduce --fold { inside: false, depth: 0, names: [] } {|line, state|
          let starts = (
              (not $state.inside)
              and ($line =~ r#'(?:^|[;|{])\s*load-env\s*\{'#)
          )

          let active = ($state.inside or $starts)

          let keys = if $active {
              [
                  ($line
                      | parse --regex r#'(?:^|[{,])\s*(?<name>[A-Za-z_][A-Za-z0-9_-]*)\s*:'#
                      | get name)
                  ($line
                      | parse --regex r#'(?:^|[{,])\s*'(?<name>[^']+)'\s*:'#
                      | get name)
                  ($line
                      | parse --regex r#'(?:^|[{,])\s*"(?<name>[^"]+)"\s*:'#
                      | get name)
              ]
              | flatten
          } else {
              []
          }

          let opens = ($line | split chars | where {|c| $c == '{'} | length)
          let closes = ($line | split chars | where {|c| $c == '}'} | length)

          let depth = if $starts {
              $opens - $closes
          } else {
              $state.depth + $opens - $closes
          }

          {
              inside: ($depth > 0)
              depth: $depth
              names: ($state.names ++ $keys)
          }
      }
      | get names
  )

  let names = (($direct ++ $loaded) | uniq --ignore-case)

  if ($names | is-empty) {
      print "No recognizable environment assignments found."
  } else {
      print $"Hiding: ($names | str join ', ')"
      hide-env --ignore-errors ...$names
  }
  }
