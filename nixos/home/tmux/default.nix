{ config, pkgs, ... }:

{
  home.packages = with pkgs;[
    tmux
    tmuxPlugins.resurrect
  ];

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    shell = "/bin/zsh";
    clock24 = true;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
    ];
    extraConfig = ''
      set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
      set-option -g default-shell $SHELL
    '';
  };

  #plugins: https://search.nixos.org/packages?channel=24.11&from=0&size=50&sort=relevance&type=packages&query=tmuxPlugins
}