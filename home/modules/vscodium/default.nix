{ pkgs, ... }:

{
  imports = [ ./catppuccin.nix ./telemetry.nix ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      # Nix
      jnoortheen.nix-ide

      # Rust 🦀
      rust-lang.rust-analyzer
      serayuzgur.crates
      tamasfe.even-better-toml
    ];

    userSettings = {
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "editor.guides.bracketPairs" = "auto";
      "references.preferredLocation" = "view";
      "workbench.startupEditor" = "none";
    };
  };
}
