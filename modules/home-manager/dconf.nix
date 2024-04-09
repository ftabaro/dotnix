# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {


    "org/gnome/Weather" = {
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Rome" "LIRU" true [ (mkTuple [ 0.7321656212116213 0.2181661564992912 ]) ] [ (mkTuple [ 0.731292956585624 0.21787526247286132 ]) ] ]) ]) ];
      window-height = 496;
      window-maximized = false;
      window-width = 1068;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      primary-color = "#3a4ba0";
      secondary-color = "#2f302f";
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "gb" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      clock-show-weekday = true;
      color-scheme = "default";
      cursor-size = 24;
      cursor-theme = "Adwaita";
      document-font-name = "Noto Sans 12";
      enable-animations = true;
      font-antialiasing = "rgba";
      font-hinting = "full";
      font-name = "Noto Sans 12";
      gtk-theme = "Adwaita";
      icon-theme = "Adwaita";
      monospace-font-name = "Hack Nerd Font 12";
      scaling-factor = mkUint32 1;
      text-scaling-factor = 1.0;
      toolbar-style = "text";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-console" "org-gnome-baobab" "thunderbird" "firefox" "org-gnome-nautilus" "org-gnome-fileroller" "gnome-power-panel" "org-gnome-epiphany" "com-gitlab-newsflash" "slack" "gnome-network-panel" "sublime-text" "gimp" "code-url-handler" "org-gnome-clocks" ];
      show-banners = false;
    };

    "org/gnome/desktop/notifications/application/code-url-handler" = {
      application-id = "code-url-handler.desktop";
    };

    "org/gnome/desktop/notifications/application/com-gitlab-newsflash" = {
      application-id = "com.gitlab.newsflash.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gimp" = {
      application-id = "gimp.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-baobab" = {
      application-id = "org.gnome.baobab.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-clocks" = {
      application-id = "org.gnome.clocks.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-epiphany" = {
      application-id = "org.gnome.Epiphany.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-fileroller" = {
      application-id = "org.gnome.FileRoller.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/slack" = {
      application-id = "slack.desktop";
    };

    "org/gnome/desktop/notifications/application/sublime-text" = {
      application-id = "sublime_text.desktop";
    };

    "org/gnome/desktop/notifications/application/thunderbird" = {
      application-id = "thunderbird.desktop";
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/67k19fipar30sfl5bidp7s9kwgqgyvzn-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
      primary-color = "#3a4ba0";
      secondary-color = "#2f302f";
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "icon:minimize,maximize,close";
      focus-mode = "sloppy";
      titlebar-font = "Noto Sans Bold 12";
    };

    "org/gnome/eog/ui" = {
      sidebar = false;
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = false;
      window-size = mkTuple [ 1024 768 ];
    };

    "org/gnome/evince/default" = {
      continuous = true;
      dual-page = false;
      dual-page-odd-left = false;
      enable-spellchecking = true;
      fullscreen = false;
      inverted-colors = false;
      show-sidebar = true;
      sidebar-page = "thumbnails";
      sidebar-size = 132;
      sizing-mode = "automatic";
      window-ratio = mkTuple [ 1.3512605042016808 1.2707838479809976 ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 250;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };

    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      center-new-windows = false;
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/nautilus/list-view" = {
      use-tree-view = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
      search-view = "list-view";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 1300 1095 ];
    };

    "org/gnome/portal/filechooser/slack" = {
      last-folder-path = "/home/francesco/Downloads";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-temperature = mkUint32 3200;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Control>t";
      command = "kitty";
      name = "Launch terminal";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ "dash-to-dock@micxgx.gmail.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "org.gnome.Calendar.desktop" "firefox.desktop" "thunderbird.desktop" "bitwarden.desktop" "kitty.desktop" "code.desktop" "sublime_text.desktop" "mendeley-reference-manager.desktop" ];
      welcome-dialog-last-shown-version = "44.2";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = false;
      background-opacity = 0.8;
      click-action = "minimize";
      custom-theme-customize-running-dots = true;
      custom-theme-running-dots-border-width = 3;
      custom-theme-running-dots-color = "rgb(59,77,161)";
      custom-theme-shrink = true;
      dash-max-icon-size = 38;
      disable-overview-on-startup = true;
      dock-position = "LEFT";
      extend-height = true;
      height-fraction = 0.9;
      max-alpha = 0.8;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "DP-2";
      running-indicator-style = "DOTS";
      scroll-action = "cycle-windows";
      show-mounts = false;
      transparency-mode = "DYNAMIC";
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Rome" "LIRU" true [ (mkTuple [ 0.7321656212116213 0.2181661564992912 ]) ] [ (mkTuple [ 0.731292956585624 0.21787526247286132 ]) ] ]) ]) ];
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.23137255012989044 0.301960825920105 0.6313725709915161 1.0 ]) ];
      selected-color = mkTuple [ true 0.23137255012989044 0.301960825920105 0.6313725709915161 1.0 ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = mkTuple [ 1176 765 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 175;
      sort-column = "modified";
      sort-directories-first = false;
      sort-order = "descending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 1338 982 ];
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 550;
      manager-window-width = 550;
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };

  };
}
