{ inputs, config, pkgs, lib, ... }:

let
  baseConfig = import ./../modules/nixos/base.nix {
    inherit inputs config pkgs;
  };

  kvmModule = [ "kvm-amd" ];

  # Add kvm-amd kernel module to the kernelModules array.
  # If the array is not defined, define it with the kvmModule array.
  # Otherwise, append kvmModule to config.boot.kernelModules.
  newConfig =
    if config.boot.kernelModules != null then
      {
        boot = config.boot // {
          kernelModules = config.boot.kernelModules ++ kvmModule;
        };
      }
    else {
      boot = config.boot // {
        kernelModules = kvmModule;
      };
    };
in
{
  # Inherit the newConfig object as new config
  inherit (config // { boot = newConfig; });

  # enable virtualisation
  config.virtualisation.libvirtd = with pkgs;
    {
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

  config.users.users.francesco.extraGroups = baseConfig.users.users.francesco.extraGroups ++ [ "libvirtd" ];
}
