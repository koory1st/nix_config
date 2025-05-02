{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    tmux
  ];

  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
      ...
    '';
  };
}