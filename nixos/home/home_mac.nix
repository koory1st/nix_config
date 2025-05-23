{ config, pkgs, ... }:

{
  imports = [
    ./zsh
    ./git/lazygit
    ./git/jujutsu
    ./neovim
    ./archive
    ./tmux
    ./coding/rust
    ./coding/rust/mac.nix
    ./editor/zed
  ];

  # 注意修改这里的用户名与用户目录
  home.username = "levygu";
  home.homeDirectory = "/Users/levygu";

  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装
  home.packages = with pkgs;[
    # 如下是我常用的一些命令行工具，你可以根据自己的需要进行增删
    neofetch
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "levy";
    userEmail = "32436334@qq.com";
  };

  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
