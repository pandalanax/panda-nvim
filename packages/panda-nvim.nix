# packages/myNeovim.nix
{pkgs}: let
  customRC = import ../config {inherit pkgs;};
  plugins = import ../plugins.nix {inherit pkgs;};
  runtimeDeps = import ../runtimeDeps.nix {inherit pkgs;};
  xmlDependencies = pkgs.symlinkJoin {
    name = "xmlDependencies";
    paths = runtimeDeps.xmlRuntime;
  };
  nixDependencies = pkgs.symlinkJoin {
    name = "nixDependencies";
    paths = runtimeDeps.nixRuntime;
  };
  pythonDependencies = pkgs.symlinkJoin {
    name = "pythonDependencies";
    paths = runtimeDeps.pythonRuntime;
  };

  yamlDependencies = pkgs.symlinkJoin {
    name = "yamlDependencies";
    paths = runtimeDeps.yamlRuntime;
  };
  dockerDependencies = pkgs.symlinkJoin {
    name = "dockerDependencies";
    paths = runtimeDeps.dockerRuntime;
  };
  myNeovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      inherit customRC;
      packages.all.start = plugins;
    };
  };
in
  pkgs.writeShellApplication {
    name = "nvim";
    runtimeInputs = [pythonDependencies nixDependencies xmlDependencies yamlDependencies dockerDependencies];
    text = ''
      ${myNeovimUnwrapped}/bin/nvim "$@"
    '';
  }
