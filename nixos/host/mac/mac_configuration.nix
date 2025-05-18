
{ config, lib, pkgs, ... }:

{
  imports =
    [
    ];
 
  users.users.levygu = {
    home = "/Users/levygu";
  };
  nixpkgs.config.allowUnfree = true;
  fonts.packages = [
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.hack-font
    pkgs.jetbrains-mono
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-cjk-serif
    # sarasa-gothic # 更纱黑体
    # source-code-pro
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
  ];
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  system.stateVersion = 6;
}

