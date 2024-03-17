{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix

    ];

  # Bootloader.
  boot = with pkgs; {

    kernelPackages = linuxPackages_latest;

    kernelParams = [ "quiet" "video=2560x1440" ];

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
      kernelModules = [ "amdgpu" ];
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    francesco = {
      description = "Francesco Tabaro";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
      ];
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

  environment = {
    variables = {
      AMD_VULKAN_ICD = "RADV";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      NIX_PROFILES = "${pkgs.lib.concatStringsSep " " (pkgs.lib.reverseList config.environment.profiles)}";
    };
    systemPackages = with pkgs; [
      vim
      wget
      curl
      zip
      unzip
      unrar
      xz
      bzip2
      pbzip2
      gawk
      git
      jq
      killall
      lm_sensors
      openconnect-sso
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    dconf.enable = true;
  };

  system = {
    stateVersion = "23.05"; # Don't change this !
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      operation = "switch";
    };
  };

  hardware = {

    opengl = {
      extraPackages = with pkgs; [
        rocm-opencl-icd
        amdvlk
      ];
      # To enable Vulkan support for 32-bit applications, also add:
      extraPackages32 = with pkgs.driversi686Linux; [
        amdvlk
      ];
    };

    logitech.wireless.enable = true;

    pulseaudio.enable = false;
  };


  sound.enable = true;

  services = {
    fstrim.enable = true;

    gnome.games.enable = false;

    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      desktopManager = {
        plasma5 = {
          enable = true;
        };
        plasma6 = {
          enable = false;
        };
        gnome = {
          enable = false;
        };
      };
      displayManager = {
        defaultSession = "plasmawayland";
        gdm = {
          enable = false;
        };
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

  };

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
    };
  };

  # enable virtualisation
  virtualisation.libvirtd = with pkgs; {
    enable = true;
    qemu = {
      package = qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita";
  };
}
