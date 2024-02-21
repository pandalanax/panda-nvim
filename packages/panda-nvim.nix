# packages/myNeovim.nix
{ pkgs }:
let
  customRC = import ../config { inherit pkgs; };
  plugins = import ../plugins.nix { inherit pkgs;};
  runtimeDeps = import ../runtimeDeps.nix { inherit pkgs; };

  pythonDependencies = pkgs.symlinkJoin {
    name = "pythonDependencies ";
    paths = runtimeDeps.pythonRuntime;
  };
  myNeovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      inherit customRC;
      packages.all.start = plugins;
    };
  };
in pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = [ pythonDependencies ];
  text = ''
    ${myNeovimUnwrapped}/bin/nvim "$@"
  '';
}
