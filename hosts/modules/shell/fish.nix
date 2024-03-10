{ pkgs, username, ... }:

{
  users.defaultUserShell = pkgs.bash;
  programs.fish.enable = true;

  users.users."${username}" = {
    isNormalUser = true;
    description = "Jacob Highfield";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
  };

  programs.bash.interactiveShellInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION="--login" || LOGIN_OPTION=""
      SHELL="${pkgs.fish}/bin/fish" exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';
}
