{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;

    dictionaries = [ pkgs.hunspellDictsChromium.en_US ];

    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # UBlock Origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
    ];
  };
}
