#!/bin/bash
script_dir=$(cd $(dirname $0); pwd)

# Create ~/.vimrc
if [ -f $HOME/.vimrc ]; then
    echo -n "Overwrite $HOME/.vimrc? (y/n [n]): "
    read line
    if [ "$line" != 'y' ]; then
        exit
    fi
fi
rm -f $HOME/.vimrc
echo "source $script_dir/vimrc" > $HOME/.vimrc
echo "\"source $script_dir/vimrc_hugo.vim" >> $HOME/.vimrc

# Create ~/.gvimrc
if [ -f $HOME/.gvimrc ]; then
    echo -n "Overwrite $HOME/.gvimrc? (y/n [n]): "
    read line
    if [ "$line" != 'y' ]; then
        exit
    fi
fi
rm -f $HOME/.gvimrc
echo "source $script_dir/gvimrc" > $HOME/.gvimrc

# Create a backup directory.
mkdir -p $HOME/temp/vim_backup
