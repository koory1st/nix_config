{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
      darwin.libiconv
      # libiconvReal
      # libiconv
  ];

  home.file.".cargo/config.toml".text = ''
    [target.x86_64-apple-darwin]
    rustflags = "-L${pkgs.darwin.libiconv}/lib"
  '';
}