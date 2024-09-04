set -xg LANG en_US.UTF-8
set -xg LC_ALL en_US.UTF-8
set -xg LSCOLORS Exfxcxdxbxegedabagacad
set -xg TZ Europe/Berlin
set -xg BAT_THEME kanagawa

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# sdkman
set -xg __sdkman_custom_dir "$HOME/.sdkman"
