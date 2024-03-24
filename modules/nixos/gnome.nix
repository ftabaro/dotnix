{ pkgs, ... }: {

  services = {
    xserver = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      displayManager.defaultSession = "gnome";
    };
    gnome = {
      games.enable = false;
      core-os-services.enable = true;
      core-shell.enable = true;
      core-utilities.enable = true;
      gnome-keyring.enable = true;
      gnome-settings-daemon.enable = true;
      sushi.enable = true;
    };
  };
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    epiphany
    geary
    yelp
    gnome-contacts
    gnome-initial-setup
  ]);
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };
}
