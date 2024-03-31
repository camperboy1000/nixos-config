{ pkgs, ... }:

{
  home.packages = with pkgs; [ nil nixpkgs-fmt ];

  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [ jnoortheen.nix-ide arrterian.nix-env-selector ];

    userSettings = {
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "${pkgs.nil}/bin/nil";
      "nix.serverSettings" = {
        nil = {
          formatting.command = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
          nix = {
            maxMemoryMB = 4096;
            flake.autoEvalInputs = true;
          };
        };
      };
    };
  };
}
