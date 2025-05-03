{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    vscode
  ];
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      alefragnani.project-manager
      ms-vscode-remote.vscode-remote-extensionpack
      bbenoist.nix
    ];
  };
}