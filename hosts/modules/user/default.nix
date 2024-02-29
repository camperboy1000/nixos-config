{ pkgs, username, ... }:

{
  users.users."${username}" = {
    isNormalUser = true;
    description = "Jacob Highfield";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];
}
