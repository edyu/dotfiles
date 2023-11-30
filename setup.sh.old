#!/bin/zsh

#
# Prereq:
#   apt-get install zsh
#   apt-get install git
#   git clone https://github.com/edyu/dotfiles.git
#

cd $HOME

# link git files
if [[ -h .gitconfig ]]; then
  rm -f .gitconfig
elif [[ -r .gitconfig ]]; then
  mv .gitconfig .gitconfig.$$.bak
fi
ln -s ~/dev/dotfiles/git/gitconfig .gitconfig

# install prezto
if [[ ! -d .zprezto ]]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

# link zsh files
if [[ -h .zshrc ]]; then
  rm -f .zshrc
elif [[ -r .zshrc ]]; then
  mv .zshrc .zshrc.$$.bak
fi
ln -s ~/dev/dotfiles/zsh/zshrc.prezto .zshrc
if [[ -h .zpreztorc ]]; then
  rm -f .zpreztorc
elif [[ -r .zpreztorc ]]; then
  mv .zpreztorc .zpreztorc.$$.bak
fi
ln -s ~/dev/dotfiles/zsh/zpreztorc .zpreztorc
if [[ ! -r ~/.zprezto/modules/prompt/functions/prompt_ed_setup ]]; then
  ln -s ~/dev/dotfiles/zsh/prompt_ed_setup ~/.zprezto/modules/prompt/functions
fi

# link tmux files
if [[ -h .tmux.conf ]]; then
  rm -f .tmux.conf
elif [[ -r .tmux.conf ]]; then
  mv .tmux.conf .tmux.conf.$$.bak
fi
ln -s ~/dev/dotfiles/tmux/tmux.conf .tmux.conf

# install haskell-vim-now
if [ `uname` = 'Linux' ]; then
  if [[ ! -f $HOME/.cabal/bin/cabal ]]; then
    cabal install cabal-install
  fi
fi
export PATH=$HOME/.cabal/bin:$PATH
cabal update
if [ `uname` = 'Linux' ]; then
  sudo apt-get install exuberant-ctags
  sudo apt-get install make
  sudo apt-get install libcurl4-openssl-dev
elif [ `uname` = 'Darwin' ]; then
  brew install ctags
  brew install wget
fi
if [[ ! -f $HOME/.cabal/bin/happy ]]; then
  cabal install happy
fi
if [[ ! -d $HOME/.haskell-vim-now ]]; then
  curl -o - https://raw.githubusercontent.com/begriffs/haskell-vim-now/master/install.sh | bash
fi

if [[ -h .vimrc.local ]]; then
  rm -f .vimrc.local
elif [[ -r .vimrc.local ]]; then
  mv .vimrc.local .vimrc.local.$$.bak
fi
ln -s ~/dev/dotfiles/vim/vimrc.local.haskell-vim-now .vimrc.local
if [[ -h .vim.local ]]; then
  rm -f .vim.local
elif [[ -r .vim.local ]]; then
  mv .vim.local .vim.local.$$.bak
fi
ln -s ~/dev/dotfiles/vim/vim.local.haskell-vim-now .vim.local

vim +PluginInstall +qall

if [[ ! -f $HOME/.cabal/bin/hlint ]]; then
  cabal install hlint
fi
if [[ ! -f $HOME/.cabal/bin/hoogle ]]; then
  cabal install hoogle
fi
if [[ ! -d $HOME/.ghc ]]; then
  mkdir $HOME/.ghc
fi
if [[ -h .ghci.conf ]]; then
  rm -f .ghci.conf
elif [[ -r .ghci.conf ]]; then
  mv .ghci.conf .ghci.conf.$$.bak
fi
ln -s ~/dev/dotfiles/haskell/ghci.conf $HOME/.ghc/.ghci.conf
