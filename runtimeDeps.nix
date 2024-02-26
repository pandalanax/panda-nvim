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
    alejandra
    statix
  ];
  dockerRuntime = with pkgs; [
    docker-compose-language-service
  ];
  xmlRuntime = with pkgs; [
    lemminx
  ];
  yamlRuntime = with pkgs; [
    yaml-language-server
    ansible-language-server
    ansible
    ansible-lint
    nodejs_21
    vscode-langservers-extracted
  ];
}
 
