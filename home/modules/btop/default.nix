{
  imports = [ ./catppuccin.nix ];

  programs.btop = {
    enable = true;

    settings = {
      update_ms = 500;
      truecolor = true;
      theme_background = true;
      rounded_corners = true;
      background_update = true;

      graph_symbol = "braille";
      graph_symbol_cpu = "default";
      graph_symbol_gpu = "default";
      graph_symbol_mem = "default";
      graph_symbol_net = "default";
      graph_symbol_proc = "default";

      show_uptime = true;
      show_battery = true;
      check_temp = true;
      show_coretemp = true;
      show_cpu_freq = true;

      proc_sorting = "cpu lazy";
      proc_tree = true;
      proc_colors = true;
      proc_gradient = false;
      proc_per_core = true;
      proc_cpu_graphs = true;
      proc_mem_bytes = true;
      proc_filter_kernel = true;
      proc_aggregate = false;

      show_disks = true;
      only_physical = true;
      swap_disk = true;
      io_mode = true;
      io_graph_combined = false;
      disk_filter = "exclude=/boot";

      net_auto = true;
      net_sync = true;
    };
  };
}
