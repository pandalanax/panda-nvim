# runtimeDeps.nix
{ pkgs }:
{
  pythonRuntime = with pkgs; [
    python311
    python311Packages.jedi-language-server
  ];
}

