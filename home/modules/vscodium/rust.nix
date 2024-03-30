{ pkgs, ... }:

{
  home.packages = with pkgs; [ rustup gcc ];

  programs.vscode = {
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      serayuzgur.crates
      tamasfe.even-better-toml
    ];
  };
}
