{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    # Hide OS choice for bootloaders (unless key is pressed)
    loader.timeout = 0;
  };
}
