{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./colorscheme.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
