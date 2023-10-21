{ config, pkgs, ... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      # Home manager
      <home-manager/nixos>
    ];

  # Bootloader.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "quiet" "video=2560x1440" ];

    #loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = "/boot/efi";
    
    loader.grub = {
      enable = true;
      forceInstall = true;
      gfxmodeBios = "auto";
      useOSProber = true;
      theme = pkgs.nixos-grub2-theme;
      splashMode = "stretch";
      gfxpayloadEfi = "keep";
      gfxmodeEfi = "2560x1440";
      device = "nodev"; 
      default = "0";
      enableCryptodisk = true;
      extraGrubInstallArgs = [ "--modules=lvm btrfs part_gpt" ];
      efiSupport = true;
      fsIdentifier = "label";
      configurationLimit = 2;
    };

    # Setup keyfile
    initrd = {
      secrets = {
        "/crypto_keyfile.bin" = null;

      };
      systemd.enable = true;
      kernelModules = [ "amdgpu" ];
      luks.devices.root = {
        device = "/dev/disk/by-uuid/dc016563-0f57-4308-b477-ad323d9f74f6";
        keyFile = "/crypto_keyfile.bin";
        bypassWorkqueues = true;
        allowDiscards = false;
	      preLVM = true;
      };
    };
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

  networking.hostName = "norbert"; # Define your hostname.

  # Enable networking
  networking.networkmanager = {
    enable = true;
    dhcp = "dhcpcd";
  };


  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.utf8";
    LC_IDENTIFICATION = "it_IT.utf8";
    LC_MEASUREMENT = "it_IT.utf8";
    LC_MONETARY = "it_IT.utf8";
    LC_NAME = "it_IT.utf8";
    LC_NUMERIC = "it_IT.utf8";
    LC_PAPER = "it_IT.utf8";
    LC_TELEPHONE = "it_IT.utf8";
    LC_TIME = "it_IT.utf8";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    francesco = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in the system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl 
    htop
    unzip
    zip 
    xz
    bzip2
    pbzip2
    gawk 
    git 
    gparted
    jq
    libreoffice-fresh
    firefox-wayland
    thunderbird
    gnome.gnome-tweaks
    nixpkgs-fmt
  ];
  environment.pathsToLink = [ "/share/bash-completion" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
  
  #############
  ## MY MODS ##
  #############
  
  # Do not allow autoreboot
  system.autoUpgrade.allowReboot = false;

  # OpenCL and Vulkan
  hardware.opengl = {
    extraPackages = [ 
      rocm-opencl-icd
      amdvlk
    ];
    # To enable Vulkan support for 32-bit applications, also add:
    extraPackages32 = [
      driversi686Linux.amdvlk
    ];
  };

  # Force radv
  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Gnome
  services.gnome.games.enable = false;
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    desktopManager.gnome.enable = true;
    displayManager = {
      gdm = {
        enable = true;
        autoLogin.delay = 1;
      };
      autoLogin = {
        enable = true;
        user = "francesco";
        };
      };
  };

  # Nix experimental features
  nix.settings.experimental-features = [
    "nix-command" 
    "flakes"
  ];
  nix.settings.allowed-users = [
    "@wheel"
  ];
  
  fonts = {
    fonts = with pkgs; [
      hack-font
      ibm-plex
      noto-fonts
      ubuntu_font_family
    ];
    enableDefaultFonts = true;
    fontconfig = {
      defaultFonts = {
        serif = [ "DejaVu Serif" ];
        sansSerif = [ "Cantarell" ];
        monospace = [ "Hack" "FreeMono" ];
        emoji = [ "Noto Color Emoji" ];
      };
      antialias = true; 
    };
  };
}
