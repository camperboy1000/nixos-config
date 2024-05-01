{
  description = "Jacob's NixOS Flake ❄️";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    nix-hardware.url = "github:NixOS/nixos-hardware";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixvim-stable = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs = {
        nixpkgs.follows = "nixpkgs-stable";
        # home-manager.follows = "home-manager-stable";
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

    catppuccin-vscode = {
      url = "github:catppuccin/vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self
    , nixpkgs
    , nixpkgs-stable
    , nix-hardware
    , lanzaboote
    , home-manager
    , home-manager-stable
    , ...
    }:
    let
      username = "camperboy1000";

      catppuccin = {
        flavor = "Macchiato";
        color = "Mauve";

        bat = inputs.catppuccin-bat;
        btop = inputs.catppuccin-btop;
        starship = inputs.catppuccin-starship;
        vscode = inputs.catppuccin-vscode;
      };
    in
    {
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

        "jellyfish" = nixpkgs-stable.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit username; };

          modules = [
            nix-hardware.nixosModules.common-cpu-intel
            nix-hardware.nixosModules.common-gpu-intel
            ./hosts/jellyfish

            home-manager-stable.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users."${username}" = import ./home/jellyfish.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs username catppuccin;
              };
            }
          ];
        };
      };
    };
}
