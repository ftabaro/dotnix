{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
          "Hack"
        ];
      })
      ibm-plex
      noto-fonts
    ];
    enableDefaultPackages = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "DejaVu Serif" ];
        sansSerif = [ "Cantarell" ];
        monospace = [ "Hack" "FreeMono" ];
        emoji = [ "Noto Color Emoji" ];
      };
      antialias = true;
      hinting = {
        enable = true;
        style = "full";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
    };
  };
}
