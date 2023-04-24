if status is-interactive
  #function fish_prompt
  #	set_color $fish_color_cwd
  #	echo -n (prompt_pwd)
  #	set_color normal
  #	echo -n ' > '
  #end
  set -gx EDITOR nvim
  set -gx VISUAL nvim
  #source ~/.cargo/env

  alias vi nvim

  alias l ls
  alias ll 'ls -la'
  alias ls 'ls --color -FG'
  alias ga 'git add'
  alias gco 'git checkout'
  alias gcp 'git cherry-pick -ff'
  alias gd 'git diff'
  alias ggl 'git grep --files-with-matches'
  alias gl "git log --graph --abbrev-commit --date-order --format=format:'%Cblue%h%Creset%C(bold red)%d%Creset %s <%an> %Cgreen(%ar)%Creset' --all"
  alias gs 'git status --short'

  function edge --wraps microsoft-edge --description 'alias edge=microsoft-edge'
    microsoft-edge $argv > /dev/null 2>&1
  end

  function chrome --wraps google-chrome --description 'alias chrome=google-chrome'
    google-chrome $argv > /dev/null 2>&1
  end

  set -g fish_key_bindings fish_vi_key_bindings
  set PATH $PATH /usr/lib/dart/bin
  set PATH $HOME/.pub-cache/bin $PATH
  set PATH $HOME/.cargo/bin $PATH
  set PATH $HOME/.local/bin $PATH
  set PATH $HOME/ws/flutter/bin $PATH
  set PATH $HOME/.env/julia-1.8.5/bin $PATH

  set -x JULIA_EDITOR nvim

  set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/ed/.ghcup/bin $PATH # ghcup-env

  if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
  end

  if type -q nvm
    nvm use lts
  end
end
