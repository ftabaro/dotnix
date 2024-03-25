{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    zip
    unzip
    unrar
    xz
    bzip2
    pbzip2
    gawk
    git
    jq
    killall
    lm_sensors
  ];
}
