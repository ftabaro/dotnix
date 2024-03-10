{
  description = "My personal NixOS/Home-Manager Flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager}: {

    nixosConfigurations.norbert = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager 
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPkgs = true;
          home-manager.users.francesc = {
            imports = [
              ./home.nix
            ];
          };
        }
      ];
    };
  };
}
