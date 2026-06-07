{
  imports = [
    ./common/nix-settings.nix

    ./pkgs/darwin.nix
    ./pkgs/shared.nix

    ./programs/shared.nix
  ];

  nix.enable = false;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
