{ pkgs, ... }:

{
  imports = [
    ./catppuccin.nix
    ./telemetry.nix

    ./nix.nix
    ./rust.nix
  ];

  home.shellAliases = { "code" = "codium"; };

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
      "editor.guides.bracketPairs" = "active";
      "references.preferredLocation" = "view";
      "workbench.startupEditor" = "none";
    };
  };
}
