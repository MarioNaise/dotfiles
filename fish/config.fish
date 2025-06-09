set -xg LANG en_US.UTF-8
set -xg LC_ALL en_US.UTF-8
set -xg LSCOLORS Exfxcxdxbxegedabagacad
set -xg LS_COLORS "di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
set -xg TZ Europe/Berlin
set -xg BAT_THEME kanagawa
set -xg EDITOR nvim
alias ls='ls --color=auto -F'

# nix
if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
end

# bun
set -xg BUN_INSTALL "$HOME/.bun"
set -xg PATH $BUN_INSTALL/bin $PATH

# jetbrains
set -xg PATH ~/.jetbrains $PATH

# apache maven
set -xg PATH ~/dev/apache-maven-3.9.0/bin $PATH

# gcloud
if test -f ~/dev/google-cloud-sdk/path.fish.inc
    \. ~/dev/google-cloud-sdk/path.fish.inc
end

if test -f ~/dev/google-cloud-sdk/completion.fish.inc
    \. ~/dev/google-cloud-sdk/completion.fish.inc
end

# zoxide
zoxide init fish | source

# fzf
fzf --fish | source
source ~/.config/fish/functions/fzf-file-widget.fish
source ~/.config/fish/functions/fzf-cd-widget.fish
bind \cgh fzf-git-log-widget
bind \cgg fzf-grep-widget
