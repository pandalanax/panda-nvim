# runtimeDeps.nix
{pkgs}: {
  pythonRuntime = with pkgs; [
    python311
    python311Packages.jedi-language-server
    python311Packages.black
  ];
  goRuntime = with pkgs; [
    go
    gopls
    gofumpt
  ];
  nixRuntime = with pkgs; [
    #nixd
    nil
    alejandra
    statix
    rustfmt
    rust-analyzer
    rustc
    cargo
  ];
  dockerRuntime = with pkgs; [
    docker-compose-language-service
  ];
  xmlRuntime = with pkgs; [
    lemminx
  ];
  yamlRuntime = with pkgs; [
    yaml-language-server
    lua-language-server
    ltex-ls
    ripgrep
    git
    stylua
    xmlformat
    ansible-language-server
    ansible
    ansible-lint
    nodejs_21
    nodePackages.prettier
    vscode-langservers-extracted
    nodePackages_latest.svelte-language-server
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
  ];
}
