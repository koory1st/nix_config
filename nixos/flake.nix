{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    # nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = { self, nixpkgs, home-manager, vscode-server, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./host/nixos/nixos_configuration.nix
          
          vscode-server.nixosModules.default ({ config, pkgs, ... }: {
            services.vscode-server.enable = true;
          })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.levy = import ./home/home.nix;
          }
        ];
      };
    };
    # darwinConfigurations."levy-mac1" = nix-darwin.lib.darwinSystem  {
    #   system = "x86_64-darwin";
    #   modules = [
    #     ./host/mac/mac_configuration.nix
    #     home-manager.darwinModules.home-manager
    #     {
    #       home-manager.useGlobalPkgs = true;
    #       home-manager.useUserPackages = true;
    #       home-manager.users.levygu = import ./home/home_mac.nix;
    #     }
    #   ];
    #   specialArgs = { inherit inputs; };
    # };
  };
}
