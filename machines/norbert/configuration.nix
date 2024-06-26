{ inputs
, outputs
, ...
}: {
  imports = [

    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ./../../modules/nixos/base.nix
    ./../../modules/nixos/packages.nix
    ./../../modules/nixos/amdgpu.nix
    ./../../modules/nixos/desktop.nix
    ./../../modules/nixos/gnome.nix
    ./../../modules/nixos/fonts.nix

    ./../../services/libvirtd.nix
    ./../../services/clamav.nix
    ./../../services/printer.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      francesco =
        {
          imports = [
            ./../../modules/home-manager/base.nix
            ./../../modules/home-manager/packages.nix

            #./../../modules/home-manager/dconf.nix
            ./../../modules/home-manager/bash.nix
            ./../../modules/home-manager/vscode.nix
            ./../../modules/home-manager/kitty.nix
            ./../../modules/home-manager/thunderbird.nix

          ];
        };
    };
  };

  networking.hostName = "norbert";

}
