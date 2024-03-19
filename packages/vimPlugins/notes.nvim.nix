{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "notes";
  inherit src;
  # dontBuild = true;
}
