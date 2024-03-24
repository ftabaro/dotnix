{ inputs, config, pkgs, ... }:

let
  baseConfig = import ./../modules/nixos/base.nix { 
    inherit inputs config pkgs;
};
in
{
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

  users.users.francesco.extraGroups = baseConfig.users.users.francesco.extraGroups ++ [ "libvirtd" ];
}
