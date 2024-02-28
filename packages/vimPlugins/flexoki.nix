{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "flexoki";
  inherit src;
  # dontBuild = true;
}
