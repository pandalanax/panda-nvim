{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "tmuxjump";
  inherit src;
  # dontBuild = true;
}
