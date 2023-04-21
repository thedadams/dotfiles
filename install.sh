#!/bin/sh

set -ex

pwd=`pwd`

for f in $(ls); do
    if [[ $f != "install.sh" && $f != "sbdiff.sh" ]]; then
        rm -rf $HOME/.$f
        ln -s $pwd/$f $HOME/.$f
    fi
done
