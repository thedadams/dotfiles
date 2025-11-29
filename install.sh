#!/bin/sh

set -ex

pwd=`pwd`
config_dir=${XDG_CONFIG_HOME:-~/.config}

for f in $(ls); do
    if [[ $f == "nvim" || $f == "jj" || $f == "zellij" || $f == "zed" ]]; then
        rm -rf $config_dir/$f
        mkdir -p $config_dir/
        ln -s $pwd/$f $config_dir/$f
    elif [[ $f != "install.sh" ]]; then
        rm -rf $HOME/.$f
        ln -s $pwd/$f $HOME/.$f
    fi
done
