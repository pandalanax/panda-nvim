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
  xmlRuntime = with pkgs; [
    lemminx
  ];
  yamlRuntime = with pkgs; [
    yaml-language-server
    ansible-language-server
    ansible-lint
    yamllint
    nodejs_21
    vscode-langservers-extracted
  ];
}

