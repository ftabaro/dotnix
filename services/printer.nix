{
  programs.system-config-printer.enable = true;
  services = {
    system-config-printer.enable = true;
    printing = {
      cups-pdf.enable = true;
      enable = true;
    };
  };
}
