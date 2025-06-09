function nix-cleanup
    sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
    nix-collect-garbage -d # nix store gc
    nix store optimise --extra-experimental-features nix-command
end
