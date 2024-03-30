{ pkgs, ... }:

{
  home.packages = with pkgs; [ nil nixpkgs-fmt ];

  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [ jnoortheen.nix-ide ];

    userSettings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
    };
  };
}
