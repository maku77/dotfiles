#!/bin/bash
script_dir=$(cd $(dirname $0); pwd)

# Create ~/.vimrc
echo -n "Overwrite $HOME/.vimrc? (y/n [n]): "
read line
if [ "$line" == 'y' ]; then
    rm $HOME/.vimrc
    echo "source $script_dir/vimrc" > $HOME/.vimrc
fi

# Create ~/.gvimrc
echo -n "Overwrite $HOME/.gvimrc? (y/n [n]): "
read line
if [ "$line" == 'y' ]; then
    rm $HOME/.gvimrc
    echo "source $script_dir/gvimrc" > $HOME/.gvimrc
fi

# Create a backup directory.
mkdir -p $HOME/temp/vim_backup
