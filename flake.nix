{
  description = "Jacob's NixOS Flake ❄️";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-hardware.url = "github:NixOS/nixos-hardware";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    catppuccin-btop = {
      url = "github:catppuccin/btop";
      flake = false;
    };

    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };
  };

  outputs =
    inputs@{ self, nixpkgs, nix-hardware, lanzaboote, home-manager, ... }:
    let
      username = "camperboy1000";

      catppuccin = {
        flavor = "Macchiato";
        color = "Mauve";

        bat = inputs.catppuccin-bat;
        btop = inputs.catppuccin-btop;
        starship = inputs.catppuccin-starship;
      };
    in {
      nixosConfigurations = {
        "microwave" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit username; };

          modules = [
            nix-hardware.nixosModules.common-pc-laptop
            nix-hardware.nixosModules.common-pc-laptop-ssd
            nix-hardware.nixosModules.common-cpu-amd
            nix-hardware.nixosModules.common-cpu-amd-pstate
            nix-hardware.nixosModules.common-gpu-amd
            lanzaboote.nixosModules.lanzaboote
            ./hosts/microwave

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users."${username}" = import ./home/microwave.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs username catppuccin;
              };
            }
          ];
        };
      };
    };
}
