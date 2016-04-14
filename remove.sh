#!/bin/bash

DOT_FILES=( .atom .gitconfig .gitignore .pryrc .gemrc .tmux.conf .vimrc .zshrc .editorconfig )

for file in ${DOT_FILES[@]}
do
    rm $HOME/$file
done

rm -rf ~/.oh-my-zsh ~/.vim/dein
