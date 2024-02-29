{
  imports = [ ./gh.nix ./gitui.nix ];

  programs.git = {
    enable = true;

    userName = "Jacob Highfield";
    userEmail = "camperboy1000@gmail.com";

    signing = {
      signByDefault = true;
      key = null;
    };

    extraConfig = { init = { defaultBranch = "main"; }; };
  };
}
