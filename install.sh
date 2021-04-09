#!/bin/sh

set -ex

pwd=`pwd`
files=(alacritty.yml vimrc zshrc tmux.conf)

for f in "${files[@]}"; do
    rm -rf $HOME/.$f
    ln -s $pwd/$f $HOME/.$f
done
