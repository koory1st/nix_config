{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
      clippy
      rustc
      cargo
      rustfmt
      rust-analyzer
      gcc
      vscode-extensions.rust-lang.rust-analyzer
      jetbrains.rust-rover

      bacon
  ];
}