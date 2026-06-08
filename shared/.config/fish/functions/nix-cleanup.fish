function nix-cleanup
    nix-collect-garbage -d # nix store gc
    nix store optimise
end
