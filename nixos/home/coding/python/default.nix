{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
      jetbrains.pycharm-community
      uv
  ];
}