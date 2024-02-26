# flake.nix
# thanks to https://primamateria.github.io/blog/neovim-nix/
{
  description = "My own Neovim flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = inputs @ {self, ...}:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      overlayFlakeInputs = prev: final: {
        neovim = inputs.neovim.packages.${prev.system}.neovim;
      };

      overlayMyNeovim = prev: final: {
        myNeovim = import ./packages/panda-nvim.nix {
          pkgs = prev;
        };
      };

      pkgs = import inputs.nixpkgs {
        system = system;
        overlays = [overlayFlakeInputs overlayMyNeovim];
      };
    in {
      packages = rec {
        nvim = pkgs.myNeovim;
        default = nvim;
      };

      apps = rec {
        nvim = inputs.flake-utils.lib.mkApp {drv = self.packages.${system}.nvim;};
        default = nvim;
      };
    });
}
