{
  pkgs,
  src,
}:
pkgs.vimUtils.buildVimPlugin {
  name = "harpoon2";
  inherit src;
  # dontBuild = true;
}
