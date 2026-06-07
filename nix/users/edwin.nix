{ pkgs, ... }:

{
  users.users.edwin = {
    isNormalUser = true;
    description = "Edwin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.fish;
  };
}
