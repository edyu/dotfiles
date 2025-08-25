## windows

# update to use autoMemoryReclaim
wsl --update --pre-release
# run in admin terminal
New-Item -Path C:\Users\edlyu\.wslconfig -ItemType SymbolicLink -Value C:\Users\edlyu\ws\dotfiles\windows\wslconfig
# install systemd by overwrite/copy the file `/etc/wsl.conf`
# snap requires systemd
cp wsl.conf /etc/wsl.conf
# restart wsl with `wsl --shutdown`

# sync time
sudo apt install chrony
sudo systemctl restart chrony.service

# pwsh
# run in admin terminal
New-Item -Path $PROFILE -ItemType SymbolicLink -Value C:\Users\edlyu\ws\dotfiles\windows\pwsh\Microsoft.PowerShell_profile.ps1
#New-Item -Path C:\Users\edlyu\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value C:\Users\edlyu\ws\dotfiles\windows\pwsh\Microsoft.PowerShell_profile.ps1
# ln C:\Users\edlyu\ws\dotfiles\windows\pwsh\Microsoft.PowerShell_profile.ps1 C:\Users\edlyu\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
#choco install colortools
#cd c:\ProgramData\chocolatey\lib\colortool\content
#download Nord.itermcolors

# helix
winget install Helix.Helix
mkdir C:\Users\edlyu\AppData\Roaming\helix\themes
# run in admin terminal
New-Item -Path C:\Users\edlyu\AppData\Roaming\helix\config.toml -ItemType SymbolicLink -Value C:\Users\edlyu\ws\dotfiles\helix\config.toml
New-Item -Path C:\Users\edlyu\AppData\Roaming\helix\languages.toml -ItemType SymbolicLink -Value C:\Users\edlyu\ws\dotfiles\helix\languages.toml
New-Item -Path C:\Users\edlyu\AppData\Roaming\helix\themes\everblush_custom.toml -ItemType SymbolicLink -Value C:\Users\edlyu\ws\dotfiles\helix\themes\everblush_custom.toml

# nvim
#ln C:\Users\edlyu\ws\dotfiles\windows\nvim C:\Users\edlyu\.config\nvim
#ln C:\Users\edlyu\ws\dotfiles\windows\nvim C:\Users\edlyu\AppData\Local\nvim
#iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
#    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

#terminal
cp C:\Users\edlyu\ws\dotfiles\windows\terminal\settings.json C:\Users\edlyu\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

#alacritty
ln C:\Users\edlyu\ws\dotfiles\windows\alacritty\alacritty.yml C:\Users\edlyu\AppData\Roaming\alacritty\alacritty.yaml 

## wsl
# fish
ln -s ~/ws/dotfiles/fish/config.fish ~/.config/fish/config.fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
ln -s ~/ws/dotfiles/fish/fish_plugins ~/.config/fish/fish_plugins
fisher update
# fisher plugin needs fzf 0.3+ but ubuntu 22.04 only installs 0.29
# download from https://github.com/junegunn/fzf/releases
mkdir -p ~/.env
mkdir -p ~/bin
#fisher install ilancosman/tide
#fisher install jorgebucaran/hydro
#ln -s ~/ws/dotfiles/windows/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish

# git
ln -s ~/ws/dotfiles/git/gitconfig ~/.gitconfig

# nvim
sudo snap install nvim --classic
git clone git@github.com:AstroNvim/AstroNvim ~/.config/nvim
git clone git@github.com:edyu/astronvim ~/.config/nvim/lua/user

# node
sudo snap install node --classic

# zig
# daily
sudo snap install zig --edge --classic
# release
sudo snap install zig --beta --classic

# alpine
alpine config --default-user root

# helix
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix
sudo snap install marksman
ln -s ~/ws/dotfiles/windows/helix/config.toml ~/.config/helix/config.toml
ln -s ~/ws/dotfiles/windows/helix/languages.toml ~/.config/helix/languages.toml
mkdir -p ~/.config/helix/runtime/queries

# golang
go install golang.org/x/tools/gopls@latest
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/go-delve/delve/cmd/dlv@latest

# ocaml
sudo apt install ocaml opam
opam init
# opam switch # check environment
# eval (opam env)
opam install core core_bench utop
# setup utop
ln -s ~/ws/dotfiles/ocaml/ocamlinit ~/.ocamlinit
# setup helix
opam install ocaml-lsp-server ocamlformat
ln -s ~/ws/dotfiles/ocaml/ocamlformat ~/.ocamlformat

# install odin, zls and ols in ~/.env and then link to them from ~/bin
