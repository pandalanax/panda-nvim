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
    flake-compat = {
      # Needed along with default.nix in root to allow nixd lsp to do completions
      # See: https://github.com/nix-community/nixd/tree/main/docs/examples/flake
      url = "github:inclyc/flake-compat";
      flake = false;
    };
    notes = {
      # very simple note taking plugin with telescope support. thats it.
      url = "github:dhananjaylatkar/notes.nvim";
      flake = false;
    };
    tmuxjump = {
      # very simple note taking plugin with telescope support. thats it.
      url = "github:shivamashtikar/tmuxjump.vim";
      flake = false;
    };
    harpoon2 = {
      # very simple note taking plugin with telescope support. thats it.
      url = "github:ThePrimeagen/harpoon/harpoon2";
      flake = false;
    };
    cobalt = {
      # very simple note taking plugin with telescope support. thats it.
      url = "github:lalitmee/cobalt2.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {self, ...}:
    inputs.flake-utils.lib.eachDefaultSystem (system: let
      overlayFlakeInputs = prev: final: {
        neovim = inputs.neovim.packages.${prev.system}.neovim;
        vimPlugins =
          final.vimPlugins
          // {
            notes = import ./packages/vimPlugins/notes.nvim.nix {
              src = inputs.notes;
              pkgs = prev;
            };
            tmuxjump = import ./packages/vimPlugins/tmuxjump.nix {
              src = inputs.tmuxjump;
              pkgs = prev;
            };
            cobalt = import ./packages/vimPlugins/cobalt.nix {
              src = inputs.cobalt;
              pkgs = prev;
            };
          };
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
