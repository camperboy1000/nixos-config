{ pkgs, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  programs = {
    fish = {
      enable = true;
      functions = { fish_greeting = "${pkgs.fastfetch}/bin/fastfetch"; };
    };

    command-not-found.enable = true;
  };

  # Replace shell with fish when interactive unless parent process is already fish
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION="--login" || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
