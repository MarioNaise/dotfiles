{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
