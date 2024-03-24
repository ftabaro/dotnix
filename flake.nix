{
  description = "My personal NixOS/Home-Manager Flake config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      {
      formatter = forAllSystems (system: nixpkgs.legacyPacakges.${system}.alejandra);

      # norbert
      nixosConfigurations = {
        norbert = nixpkgs.lib.nixosSystem {
          specialAgs = {
            inherit inputs outputs};
              modules= [
            ./machines/norbert/configuration.nix
            ];
            }
            };

              #     ./configuration.nix
              #     home-manager.nixosModules.home-manager
              #     {
              #       home-manager = {
              #         useGlobalPkgs = true;
              #         useUserPackages = true;
              #         users.francesco = {
              #           imports = [
              #             ./home.nix
              #           ];
              #         };
              #       };
              #     }
              #   ];
              # };

              nixosConfigurations= {
              pc-boulard07= nixpkgs. lib. nixosSystem{
              specialAgs= {inherit inputs outputs};
              modules= [ ./machines/pc-boulard07/configuration.nix ];
            };
            };
            };
            }
            }