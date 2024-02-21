# runtimeDeps.nix
{ pkgs }:
{
  pythonRuntime = with pkgs; [
    python311
    python311Packages.jedi-language-server
  ];
  goRuntime = with pkgs; [
    go
    gopls
  ];
  nixRuntime = with pkgs; [
    nil
  ];
}

