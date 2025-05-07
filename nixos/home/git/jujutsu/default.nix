{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    jujutsu
    lazyjj
  ];

  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        editor = "nvim";
      };
      user = {
        name = "Levy";
        email = "32436334@qq.com";
      };
    };
  };

}