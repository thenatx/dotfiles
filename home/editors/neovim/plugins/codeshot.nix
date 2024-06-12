{ pkgs }: let
    codeshot-src = pkgs.fetchFromGitHub {
      owner = "sergioribera";
      repo = "codeshot.nvim";
      rev = "7e418c2b6e8b7aaa75d41c5c91d96a837251a18d";
      hash = "sha256-xMyn64uLZ0Gpnpt5ZGSPm/6F8bHdVezqlmvCAjwXmeA=";
    };
in
pkgs.vimUtils.buildVimPlugin {
  name = "codeshot";
  src = codeshot-src;
}
