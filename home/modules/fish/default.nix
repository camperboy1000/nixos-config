{
  imports = [ ./fastfetch.nix ];

  programs = {
    # Bash is needed to source /etc/bashrc
    bash.enable = true;
    fish.enable = true;
    command-not-found.enable = true;
  };
}
