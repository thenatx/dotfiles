{pkgs, ...}: {
  # Zed not have a declarative way to configure it for now, but
  # i'll try update this file when encontred a friendly and powered way to make it
  # you can comment the import to this file in ${self}/home/users/thenat to not install zed

  home.packages = with pkgs; [
    zed-editor
  ];
}
