{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ vim curl wget aria2 git ];
}
