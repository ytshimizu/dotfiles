#!/bin/bash

DOT_FILES=( .atom .gitconfig .gitignore .pryrc .gemrc .tmux.conf .vimrc .zshrc .editorconfig )

for file in ${DOT_FILES[@]}
do
    ln -sn $HOME/dotfiles/$file $HOME/$file
done

# install oh-my-zsh
[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install dein.vim
[ ! -d ~/.vim/dein ] && mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim && git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
