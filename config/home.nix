{ config, pkgs, osConfig, ... }:

with pkgs; {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "francesco";
    homeDirectory = "/home/francesco";
    packages = [
      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      # pkgs.hello

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
      lsd
      libreoffice-fresh
      firefox-wayland
      thunderbird
      nixpkgs-fmt
      sublime3
      bitwarden
      bitwarden-cli
      owncloud-client
      vscode
      solaar
      mendeley
      eyedropper
      inkscape
      gimp
      slack
      neofetch
      transmission
      tor-browser-bundle-bin
      dropbox
      calibre
      kitty
      statix
    ];

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.

    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    sessionVariables = {
      EDITOR = "vim";
      BW_SESSION = "GE/TWOjcOqX/pUZrnJMid4I63LiFjhnwGxVlHktqoSfH/LDBD8mQ6rBxsZu7wU5c8u/TTXAfS8ENb17bwMovNg==";
    };

    shellAliases = {
      dfx = "df -h -x tmpfs -x dev -x run";
      ip = "ip -color=auto";
      timestamp = "date +%d-%m-%y-%H%M";
      #ls = "ls --color=auto -F";
      ls = "lsd";
      grep = "grep --color=auto";
      home-manager-update = "home-manager build && home-manager switch";
      mkgeneration = "nixos-rebuild switch";
    };


  };
  
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita";
      package = adwaita-qt;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita";
      package = gnome.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = gnome.adwaita-icon-theme;
    };
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;

    bash = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      bashrcExtra = ''
        source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      
        bind 'set show-all-if-ambiguous on'
        bind 'TAB:menu-complete'
        bind 'set colored-completion-prefix on'
        bind 'set blink-matching-paren on'
        bind 'set colored-stats on'
        bind 'set expand-tilde on'
        bind 'set mark-directories on'
        bind 'set mark-symlinked-directories on'
        bind 'set visible-stats on'
        bind 'set menu-complete-display-prefix on'
      '';
      historyControl = [ "erasedups" ];
      historyFile = "~/.bash_history";
      sessionVariables = {
        PROMPT_DIRTRIM = 3;
      };
      shellOptions = [
        "autocd"
        "checkwinsize"
      ];
    };

    bat.enable = true;

    mpv.enable = true;

    git = {
      enable = true;
      userName = "Francesco Tabaro";
      userEmail = "francesco.tabaro@gmail.com";
    };

    vscode = {
      enable = true;
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;
      userSettings = {
        "window.zoomLevel" = 1.25;
        "workbench.colorTheme" = "Monokai";
        "workbench.startupEditor" = "none";
        "editor.cursorBlinking" = "solid";
        "editor.cursorStyle" = "line-thin";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.fontFamily" = "IBM Plex Mono";
        "editor.fontSize" = 12;
        "editor.lineHeight" = 1.25;
        "editor.rulers" = [ 80 120 ];
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "terminal.integrated.fontFamily" = "Hack Nerd Font Mono";
        "terminal.integrated.fontSize" = 12;
        "terminal.integrated.inheritEnv" = false;
        "errorLens.enableOnDiffView" = true;
        "files.associations" = {
          "*.rmd" = "markdown";
        };
        "[python]" = {
          "editor.defaultFormatter" = "ms-python.python";
          "editor.formatOnType" = true;
        };
        "[yaml]" = {
          "editor.defaultFormatter" = "redhat.vscode-yaml";
        };

      };
      extensions = with vscode-extensions; [
        ms-vscode-remote.remote-ssh
        ms-python.python
        bbenoist.nix
        esbenp.prettier-vscode
      ];
    };

    thunderbird = {
      enable = true;
      profiles = {
        Gmail = {
          isDefault = true;
        };
        EMBL = { };
        AOL = { };
      };
      settings = {
        "ldap_2.servers.EMBLLDAP.uri" = "ldaps://ldap.embl.de/cn=users,dc=embl,dc=org??sub?(objectclass=*)";
        "ldap_2.servers.EMBLLDAP.uid" = "fbe19564-b399-407e-be05-700a48964340";
        "ldap_2.servers.EMBLLDAP.descriptions" = "EMBL LDAP";
        "ldap_2.servers.EMBLLDAP.auth.dn" = "";
        "ldap_2.servers.EMBLLDAP.auth.saslmech" = "";
        "ldap_2.servers.EMBLLDAP.filename" = "ldap.sqlite";
        "ldap_2.servers.EMBLLDAP.maxHits" = 100;
        "mailnews.default_sort_order" = 2;
        "mailnews.default_sort_type" = 18;
      };
    };

    kitty = {
      enable = true;
      package = kitty;
      environment = {
        LS_COLORS = "1";
      };
      font = {
        name = "Hack Nerd Font Mono";
        size = 13;
      };
      keybindings = { };
      settings = {
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        force_ltr = "no";
        adjust_line_height = "0";
        adjust_column_width = "0";
        disable_ligatures = "never";
        font_features = "none";
        box_drawing_scale = "0.001, 1, 1.5, 2";
        cursor = "#00ff00";
        cursor_text_color = "background";
        cursor_shape = "block";
        cursor_beam_thickness = "1.5";
        cursor_underline_thickness = "2.0";
        cursor_blink_interval = "0";
        cursor_stop_blinking_after = "15.0";
        scrollback_lines = "-1";
        scrollback_pager = "less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER";
        scrollback_pager_history_size = "0";
        wheel_scroll_multiplier = "5.0";
        touch_scroll_multiplier = "1.0";
        mouse_hide_wait = "-1";
        url_color = "#b0b0b0";
        url_style = "curly";
        open_url_modifiers = "kitty_mod";
        open_url_with = "default";
        url_prefixes = "http https file ftp";
        detect_urls = "yes";
        copy_on_select = "yes";
        strip_trailing_spaces = "smart";
        rectangle_select_modifiers = "ctrl+alt";
        terminal_select_modifiers = "shift";
        select_by_word_characters = "@-./_~?&=%+#";
        click_interval = "-1.0";
        focus_follows_mouse = "yes";
        pointer_shape_when_grabbed = "hand";
        default_pointer_shape = "beam";
        pointer_shape_when_dragging = "beam";
        repaint_delay = "10";
        input_delay = "3";
        sync_to_monitor = "yes";
        enable_audio_bell = "no";
        visual_bell_duration = "0.0";
        window_alert_on_bell = "yes";
        bell_on_tab = "yes";
        command_on_bell = "none";
        remember_window_size = "no";
        initial_window_width = "123c";
        initial_window_height = "42c";
        enabled_layouts = "*";
        window_resize_step_cells = "2";
        window_resize_step_lines = "2";
        window_border_width = "0.5pt";
        draw_minimal_borders = "no";
        window_margin_width = "0";
        single_window_margin_width = "-1";
        window_padding_width = "0";
        placement_strategy = "center";
        active_border_color = "#505050";
        inactive_border_color = "#202020";
        bell_border_color = "#ff5a00";
        inactive_text_alpha = "1.0";
        hide_window_decorations = "no";
        resize_debounce_time = "0.1";
        resize_draw_strategy = "static";
        resize_in_steps = "no";
        confirm_os_window_close = "0";
        tab_bar_edge = "top";
        tab_bar_margin_width = "0.0";
        tab_bar_style = "fade";
        tab_bar_min_tabs = "2";
        tab_switch_strategy = "previous";
        tab_fade = "0.25 0.5 0.75 1";
        tab_separator = " ┇";
        tab_activity_symbol = "none";
        tab_title_template = "{ title }";
        active_tab_title_template = "none";
        active_tab_foreground = "#d0d0d0";
        active_tab_background = "#151515";
        active_tab_font_style = "bold-italic";
        inactive_tab_foreground = "#b0b0b0";
        inactive_tab_background = "#202020";
        inactive_tab_font_style = "normal";
        tab_bar_background = "none";
        background = "#151515";
        foreground = "#d0d0d0";
        background_opacity = "1.0";
        background_image = "none";
        background_image_layout = "tiled";
        background_image_linear = "no";
        dynamic_background_opacity = "no";
        background_tint = "0.0";
        dim_opacity = "0.75";
        selection_foreground = "#151515";
        selection_background = "#d0d0d0";
        color0 = "#151515";
        color8 = "#505050";
        color1 = "#ac4142";
        color9 = "#ac4142";
        color2 = "#90a959";
        color10 = "#90a959";
        color3 = "#f4bf75";
        color11 = "#f4bf75";
        color4 = "#6a9fb5";
        color12 = "#6a9fb5";
        color5 = "#aa759f";
        color13 = "#aa759f";
        color6 = "#75b5aa";
        color14 = "#75b5aa";
        color7 = "#d0d0d0";
        color15 = "#f5f5f5";
        color16 = "#d28445";
        color17 = "#8f5536";
        color18 = "#202020";
        color19 = "#303030";
        color20 = "#b0b0b0";
        color21 = "#e0e0e0";
        mark1_foreground = "black";
        mark1_background = "#98d3cb";
        mark2_foreground = "black";
        mark2_background = "#f2dcd3";
        mark3_foreground = "black";
        mark3_background = "#f274bc";
        shell = ".";
        editor = ".";
        close_on_child_death = "no";
        allow_remote_control = "no";
        listen_on = "none";
        update_check_interval = "24";
        startup_session = "none";
        clipboard_control = "write-clipboard write-primary";
        allow_hyperlinks = "yes";
        term = "xterm-256color";
        linux_display_server = "wayland";
        wayland_titlebar_color = "#292929";
        kitty_mod = "ctrl+shift";
        clear_all_shortcuts = "no";
      };
      shellIntegration.enableBashIntegration = true;
      #kitty.theme = "Space Gray Eighties";
    };
  };

  accounts = {
    email.accounts = {
      Gmail = {
        flavor = "gmail.com";
        primary = true;
        realName = "Francesco Tabaro";
        address = "francesco.tabaro@gmail.com";
        thunderbird = {
          enable = true;
          settings = id: {
            "mail.server.server_${id}.authMethod" = 10;
            "mail.smtpserver.smtp_${id}.authMethod" = 10;
          };
        };
      };
      EMBL = {
        primary = false;
        flavor = "plain";
        realName = "Francesco Tabaro";
        address = "francesco.tabaro@embl.it";
        userName = "tabaro";
        imap = {
          host = "mail.embl.it";
          port = 993;
          tls.enable = true;
          tls.useStartTls = false;
        };
        smtp = {
          host = "mail.embl.it";
          port = 465;
          tls.enable = true;
          tls.useStartTls = false;
        };
        thunderbird = {
          enable = true;
          settings = id: {
            "mail.server.server_${id}.authMethod" = 3;
            "mail.smtpserver.smtp_${id}.authMethod" = 3;
          };
        };
      };
      AOL = {
        primary = false;
        flavor = "plain";
        realName = "Francesco Tabaro";
        userName = "tbrfnc88@aol.com";
        address = "tbrfnc88@aol.com";
        imap = {
          host = "imap.aol.com";
          port = 993;
          tls.enable = true;
          tls.useStartTls = false;
        };
        smtp = {
          host = "smtp.aol.com";
          port = 465;
          tls.enable = true;
        };
        thunderbird = {
          enable = true;
          settings = id: {
            "mail.server.server_${id}.authMethod" = 10;
            "mail.smtpserver.smtp_${id}.authMethod" = 10;
          };
        };
      };
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
