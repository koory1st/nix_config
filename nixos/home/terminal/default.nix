{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    tmux
  ];

  programs.tmux = {
    enable = true;
    # clock24 = true;
    # extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
    #   ...
    # '';
  };

  #plugins: https://search.nixos.org/packages?channel=24.11&from=0&size=50&sort=relevance&type=packages&query=tmuxPlugins

}