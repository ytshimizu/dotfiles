#!/bin/bash

DOT_FILES=( .atom .vim .gitconfig .gitignore .pryrc .gemrc .tmux.conf .vimrc .zshrc .editorconfig .gitattributes .ctags )

for file in ${DOT_FILES[@]}
do
    rm $HOME/$file
done

rm -rf ~/.oh-my-zsh ~/.vim/dein
