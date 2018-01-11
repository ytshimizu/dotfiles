#!/bin/bash

DOT_FILES=( .atom .vim .gitconfig .gitignore .pryrc .gemrc .tmux.conf .vimrc .zshrc .editorconfig .gitattributes .ctags )

for file in ${DOT_FILES[@]}
do
    ln -sfn $HOME/dotfiles/$file $HOME/$file
done

# install oh-my-zsh
[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install dein.vim
[ ! -d ~/.vim/dein ] && mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim && git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim

GIT_CONFIG_LOCAL=~/.gitconfig.local
if [ ! -e $GIT_CONFIG_LOCAL ]; then
	echo -n "git config user.email?> "
	read GIT_AUTHOR_EMAIL

	echo -n "git config user.name?> "
	read GIT_AUTHOR_NAME

	cat << EOF > $GIT_CONFIG_LOCAL
[user]
    name = $GIT_AUTHOR_NAME
    email = $GIT_AUTHOR_EMAIL
EOF
fi
