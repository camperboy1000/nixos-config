{ pkgs, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  programs.fish = {
    functions = { fish_greeting = "${pkgs.fastfetch}/bin/fastfetch"; };
  };

  home.file.".config/fastfetch/config.conf".text = ''
    --percent-type 3

    --structure Title:Separator:OS:Host:Kernel:Uptime:Shell:DE:WM:WMTheme:Theme:Icons:Terminal:CPU:GPU:Memory:Swap:Disk:Battery:PowerAdapter:Break:DateTime:Media:Break:Colors
  '';
}
