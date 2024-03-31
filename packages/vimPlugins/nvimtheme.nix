{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "nvimtheme";
  inherit src;
  # dontBuild = true;
}
