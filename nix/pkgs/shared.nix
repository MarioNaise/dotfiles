{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-index
    nix-tree
    nix-output-monitor
    nix-doc
    nixfmt

    # dev tools
    act
    bun
    cargo
    cmake
    elixir
    gh
    git-lfs
    github-copilot-cli
    go
    lazygit
    lua
    nodejs
    pnpm
    postman
    redis
    rust-analyzer
    rustc
    sqlite
    tree-sitter
    wget
    yarn
    zig

    # utils
    bat
    btop
    curlie
    dust
    entr
    exiftool
    eza
    fd
    ffmpeg
    file
    fzf
    glow
    inetutils
    jq
    lynx
    mc
    ncspot
    ngrok
    nmap
    ripgrep
    rsync
    timg
    tldr
    tree
    samba
    starship
    stow
    unzip
    yazi
    zip
    zoxide

    # fun
    asciiquarium-transparent
    cbonsai
    clock-rs
    cmatrix
    fastfetch
    figlet
    gti
    onefetch
    pipes
  ];
}
