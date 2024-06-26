{ pkgs, inputs, ... }: with pkgs; {
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    lsd
    bat
    libreoffice-fresh
    firefox-wayland
    thunderbird
    nixpkgs-fmt
    # sublime3
    bitwarden
    bitwarden-cli
    owncloud-client
    vscode
    solaar
    mendeley
    eyedropper
    inkscape
    gimp
    slack
    neofetch
    transmission
    tor-browser-bundle-bin
    dropbox
    calibre
    kitty
    statix
    htop
    gparted
    gnomeExtensions.dash-to-dock
    virt-manager
    inputs.openconnect-sso.packages.${pkgs.stdenv.hostPlatform.system}.default
    dconf2nix
  ] ++ (with pkgs.gnome; [
    gnome-tweaks
    file-roller
  ]);
}
