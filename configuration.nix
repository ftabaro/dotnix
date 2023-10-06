# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      # Include nixos-hardware configuration for Lenoto T14
      <nixos-hardware/lenovo/thinkpad/t14>
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Linux kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true; 
    };
  };

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Nvidia driver
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
    ];
  };
  

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Nvidia power management
    powerManagement.enable = false;
    
    # Fine-grained power management.
    powerManagement.finegrained = false;  

    # Use the Nvidia open source kernel module. GeForce MX330 is not supported.
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    open = false;

    # Enable Nvidia settings menu
    nvidiaSettings = true;

    # Set driver version
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Configure Prime
    prime = {
      # Offload mode. 
      #offload = {
      #  enable = true;
      #  enableOffloadCmd = true;
      #};
      # Sync mode. More power hungry than offload mode. Cannot be both active.
      sync.enable = true;

      # Triple check Bus ID!
      intelBusId = "PCI:0:1:0";
      nvidiaBusId = "PCI:8:0:0";
    };
  };
    
  # Blacklist nouveau
  boot = {
    extraModprobeConfig = "option nvidia-drm.modeset=1";
    blacklistedKernelModules = [
      "nouveau"
      "rivafb"
      "nvidiafb"
      "rivatv"
      "nv"
      "uvcvideo"
    ];
    extraModulePackages = [config.boot.kernelPackages.nvidia_x11];
    kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"]; 
    kernelParams = [
      "nouveau.modeset=0"
      "nohibernate"
      "nvidia-drm.modeset=1"
    ]; 
    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };  

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
    exportConfiguration = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Configure keymap in X11
    layout = "gb";
    xkbVariant = "";

   # Enable touchpad support (enabled default in most desktopManager).
   # services.xserver.libinput.enable = true;
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };




  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ftabaro = {
    isNormalUser = true;
    description = "Francesco Tabaro";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      thunderbird
      jq
      calibre
      gh
      tilix
      google-chrome
      htslib
      samtools
      #bamtools
      gimp
      inkscape
      slack
      sublime4
      zoom-us
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    rsync
    pciutils
    lshw
    glxinfo
    fwupd-efi
    imagemagick
    buildah
    cairo
    gnome.cheese
    gnome.eog
    cmake
    containerd
    duplicity   
    dos2unix
    evince
    ffmpeg
    flac
    fuse
    fuse3
    gawk
    geolite-legacy
    ghostscript
    gutenprint
    git
    glibc
    gnome.gnome-autoar
    gnome.gnome-calculator
    gnome.gnome-calendar
    gnome.gnome-characters
    gnome.gnome-clocks
    gnome.gnome-control-center
    gnome.simple-scan
    gnome.gnome-software
    libgnome-keyring
    gnome.gnome-logs
    gnome.gnome-maps
    gnome-menus
    gnome-online-accounts
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-dock-animator
    gnome.gnome-weather
    gparted
    gpgme
    graphviz
    gvfs
    gnome.gvfs
    gzip
    hdf5
    hostname
    htop
    hwdata
    libreoffice-fresh
    ntfs3g
    pandoc
    pinentry-gnome
    podman
    samba
    screen
    solaar
    texlive.combined.scheme-full
    thermald
    tmux
    which
    whois
    xz
    zlib
    mpv
    unzip
  ];

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

  # Enable nix experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

 
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
  
}
