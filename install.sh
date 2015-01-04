#!/bin/sh
DIR=`dirname $0`
for n in "vimrc" "vim" "gemrc" "gitconfig" "profile" "zshrc" "ssh/config"; do
  echo $n .$n;
  ln -sf $DIR/$n $HOME/.$n;
done
