{ pkgs, ... }:

{
  imports = [ ./catppuccin.nix ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [ ];

    userSettings = {
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "editor.guides.bracketPairs" = "auto";
      "references.preferredLocation" = "view";
      "workbench.startupEditor" = "none";
    };
  };
}
