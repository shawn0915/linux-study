#!/bin/bash

# ADD USER PROFILE
echo -e "
set number
set ts=4
set expandtab
" >> ~/.vimrc
source ~/.vimrc

echo -e "
alias mkdir='mkdir -v'
alias cp='cp -v'
alias ls='ls -h --color=auto' 2>/dev/null
alias rm='rm -i'
" >> ~/.bashrc
source ~/.bashrc

echo "***** DONE. *****"

