{
  programs.fzf = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    tmux.enableShellIntegration = true;

    colors = {
      "bg" = "#24273a";
      "bg+" = "#363a4f";
      "fg" = "#cad3f5";
      "fg+" = "#cad3f5";
      "hl" = "#ed8796";
      "hl+" = "#ed8796";
      "header" = "#ed8796";
      "info" = "#c6a0f6";
      "pointer" = "#f4dbd6";
      "spinner" = "#f4dbd6";
      "marker" = "#f4dbd6";
      "prompt" = "#c6a0f6";
    };
  };
}
