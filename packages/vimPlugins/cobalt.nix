{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "cobalt";
  inherit src;
  # dontBuild = true;
}
