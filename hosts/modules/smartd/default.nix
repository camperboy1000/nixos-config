{
  services.smartd = {
    enable = true;
    autodetect = true;

    defaults.monitored = "-a -o on -s (S/../.././02|L/../../7/04)";
  };
}
