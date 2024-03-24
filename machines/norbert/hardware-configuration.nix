# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/1c9593a7-d5b4-4ba1-8ec3-3e2e54316afd";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    {
      device = "/dev/disk/by-uuid/FD88-3E0B";
      fsType = "vfat";
    };

  fileSystems."/home/francesco/Projects" =
    {
      device = "/dev/disk/by-uuid/1fbfbde4-f791-4b71-aa39-9d410548be1b";
      fsType = "ext4";
    };

  fileSystems."/home/francesco/Downloads" =
    {
      device = "/dev/disk/by-uuid/d2f07bad-d04c-4d8b-996e-d13d043838c8";
      fsType = "ext4";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/48844093-6d6e-4acd-85e7-22a008df987a"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp9s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}