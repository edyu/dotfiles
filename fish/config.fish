if status is-interactive
    #function fish_prompt
    #	set_color $fish_color_cwd
    #	echo -n (prompt_pwd)
    #	set_color normal
    #	echo -n ' > '
    #end
    set -gx COLORTERM truecolor
    set -gx EDITOR hx
    set -gx VISUAL hx
    #source ~/.cargo/env

    alias vi hx

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
        microsoft-edge $argv >/dev/null 2>&1
    end

    function chrome --wraps google-chrome --description 'alias chrome=google-chrome'
        google-chrome $argv >/dev/null 2>&1
    end

    function vite
        npm create vite@latest $argv -- --template vanilla
    end

    set -gx ODIN_ROOT $HOME/.env/Odin

    set -gx GOPATH $HOME/ws/go
    fish_add_path $GOPATH/bin

    # set -g fish_cursor fish_vi_cursor
    set -g fish_key_bindings fish_vi_key_bindings
    set -U fish_cursor_default block
    set -U fish_cursor_insert line
    set -U fish_cursor_replace_one underscore
    fish_add_path $HOME/bin $HOME/.env/bin

    # set -x JULIA_EDITOR nvim

    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
    fish_add_path $HOME/.cabal/bin $HOME/.ghcup/bin # ghcup-env

    if not functions -q fisher
        set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
        curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
        fish -c fisher
    end

    if not type -q npm && type -q nvm
        nvm use lts
    end

    # opam configuration
    source /home/ed/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

    eval (opam env)
end
