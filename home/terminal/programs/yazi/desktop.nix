{ pkgs, inputs, ... }: pkgs.makeDesktopItem {
  name = "yazi";
  desktopName = "Yazi";
  exec = inputs.yazi.packages.x86_64-linux.default;
  terminal = true;
  mimeType = [ "inode/directory" ];
}
