{ pkgs, ... }:

{
  imports = [
    ./catppuccin.nix
    ./telemetry.nix

    ./nix.nix
    ./rust.nix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    # Allow projects to recommend their own extensions
    mutableExtensionsDir = true;

    userSettings = {
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "editor.guides.bracketPairs" = "auto";
      "references.preferredLocation" = "view";
      "workbench.startupEditor" = "none";
    };
  };
}
