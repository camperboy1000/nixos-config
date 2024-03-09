{ pkgs, username, ... }:

{
  users.users."${username}" = {
    isNormalUser = true;
    description = "Jacob Highfield";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;
  };

  programs.fish.enable = true;
}
