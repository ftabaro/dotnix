{
  description = "My personal NixOS/Home-Manager Flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {

    nixosConfigurations.nixos = inputs.nixpkgs.nixosSystem {
      system = "x86_64-linux";
      modules = [
        "./configuration.nix"
        inputs.home-manager.nixosModules.home-manager 
        {
          home-manger.useGlobalPkgs = true;
        }
      ];
    };
  };
}
