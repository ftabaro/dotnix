{ config, pkgs, ... }:
with pkgs;
{

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "francesco";
    homeDirectory = "/home/francesco";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.

    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
      # ".face".source = ./assets/face.jpg;
      ".config/libvirt/qemu.conf". text = ''
        # Adapted from /var/lib/libvirt/qemu.conf
        # Note that AAVMF and OVMF are for Aarch64 and x86 respectively
        nvram = [ "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd", "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd" ]
      '';
    };

    sessionVariables = {
      EDITOR = "vim";
      BW_SESSION = "GE/TWOjcOqX/pUZrnJMid4I63LiFjhnwGxVlHktqoSfH/LDBD8mQ6rBxsZu7wU5c8u/TTXAfS8ENb17bwMovNg==";
    };

    shellAliases = {
      dfx = "df -h -x tmpfs -x dev -x run";
      ip = "ip -color=auto";
      timestamp = "date +%d-%m-%y-%H%M";
      ls = "lsd";
      grep = "grep --color=auto";
      cat = "bat";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita";
      package = adwaita-qt;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita";
      package = gnome.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = gnome.adwaita-icon-theme;
    };
  };

  programs = {
    home-manager.enable = true;
    mpv.enable = true;
    bat.enable = true;
    git = {
      enable = true;
      userName = "Francesco Tabaro";
      userEmail = "francesco.tabaro@gmail.com";
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}  
