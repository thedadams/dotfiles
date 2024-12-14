var pwd = (pwd)
var config_dir = $E:HOME/.config
if (has-env XDG_CONFIG_HOME) {
    set config_dir = $E:XDG_CONFIG_HOME
}

for f [(ls)] {
    if (or (eq $f nvim) (eq $f elvish)) {
        echo Setting up $f
        rm -rf $config_dir/$f
        mkdir -p $config_dir/
        ln -s $pwd/$f $config_dir/$f
    } elif (and (not-eq $f install.sh) (not-eq $f sbdiff.sh)) {
        rm -rf $E:HOME/.$f
        ln -s $pwd/$f $E:HOME/.$f
    }
}
