{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;

    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
  };
}
