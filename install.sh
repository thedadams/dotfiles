#!/bin/sh

set -ex

pwd=`pwd`
config_dir=${XDG_CONFIG_HOME:-~/.config}

for f in $(ls); do
    if [[ $f == "init.vim" ]]; then
        rm -rf $config_dir/nvim/init.vim
        ln -s $pwd/$f $config_dir/nvim/init.vim
    elif [[ $f != "install.sh" && $f != "sbdiff.sh" ]]; then
        rm -rf $HOME/.$f
        ln -s $pwd/$f $HOME/.$f
    fi
done
