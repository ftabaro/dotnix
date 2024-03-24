{ inputs
, config
, pkgs
, ...
}: {

  imports = [
    ./desktop.nix
    ./gnome.nix
    ./fonts.nix
  ];

  # Bootloader.
  boot = with pkgs; {

    kernelPackages = linuxPackages_latest;

    kernelParams = [ "quiet" ];

    loader = {

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        forceInstall = true;
        gfxmodeBios = "auto";
        useOSProber = true;
        theme = nixos-grub2-theme;
        splashMode = "normal";
        gfxpayloadEfi = "keep";
        gfxmodeEfi = "2560x1440";
        device = "nodev";
        default = "saved";
        enableCryptodisk = true;
        extraGrubInstallArgs = [ ];
        efiSupport = true;
        fsIdentifier = "uuid";
        configurationLimit = 1;
      };

      timeout = 10;
    };

    initrd = {
      systemd.enable = true;
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
    };

  };

  users.mutableUsers = false;
  users.users = {
    francesco = {
      description = "Francesco Tabaro";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"

      ];
      shell = pkgs.bash;
    };
  };

  networking = {
    hostName = "norbert"; # Define your hostname.
    networkmanager = {
      enable = true;
      dhcp = "dhcpcd";
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
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
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (import "${builtins.fetchTarball "https://github.com/ThinkChaos/openconnect-sso/archive/refs/heads/fix/nix-flake.tar.gz"}/overlay.nix")
    ];
  };

  system = {
    stateVersion = "23.05"; # Don't change this !
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      operation = "switch";
    };
  };

  sound.enable = true;

  services = {
    fstrim.enable = true;

    thermald.enable = true;

    gvfs.enable = true;

    fwupd.enable = true;

    blueman.enable = true;

    udev.enable = true;

    udisks2.enable = true;

    logrotate.enable = true;

    locate = {
      enable = true;
      interval = "daily 12:00";
      pruneBindMounts = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    xserver = {
      enable = true;

    };
  };

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  # Nix experimental features
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      allowed-users = [
        "@wheel"
      ];
    };
  };


}
