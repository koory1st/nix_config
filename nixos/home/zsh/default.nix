{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    zsh
    starship
    antigen
  ];
  
  # 启用 starship，这是一个漂亮的 shell 提示符
  programs.starship = {
    enable = true;
    # 自定义配置
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.zsh = {
    enable = true;
    # enableCompletions = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;

    # plugins = [
    #   {
    #     # will source zsh-autosuggestions.plugin.zsh
    #     name = "zsh-autosuggestions";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "zsh-users";
    #       repo = "zsh-autosuggestions";
    #       rev = "v0.4.0";
    #       sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
    #     };
    #   }
    #   {
    #     name = "enhancd";
    #     file = "init.sh";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "b4b4r07";
    #       repo = "enhancd";
    #       rev = "v2.2.1";
    #       sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
    #     };
    #   }
    # ];
    # autosuggestions.enable = true;
    # syntaxHighlighting.enable = true;
  };
}