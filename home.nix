{ config, pkgs, osConfig, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "francesco";
  home.homeDirectory = "/home/francesco";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  gtk = with pkgs; {
    enable = true;
    theme = {
      name = "Adwaita";
      package = gnome.gnome-themes-extra;
    };
    iconTheme = {
      name = "Tela";
      package = tela-circle-icon-theme;
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
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

    sublime3
    bitwarden
    bitwarden-cli
    owncloud-client
    vscode
    solaar
    tilix
    mendeley
    eyedropper
    inkscape
    gimp
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
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

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/francesco/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "vim";
    BW_SESSION = "GE/TWOjcOqX/pUZrnJMid4I63LiFjhnwGxVlHktqoSfH/LDBD8mQ6rBxsZu7wU5c8u/TTXAfS8ENb17bwMovNg==";
  };

  home.shellAliases = {
    dfx = "df -h -x tmpfs -x dev -x run";
    ip = "ip -color=auto";
    timestamp = "date +%d-%m-%y-%H%M";
    ls = "ls --color=auto -F";
    grep = "grep --color=auto";
    home-manager-update = "home-manager build && home-manager switch";
    mkgeneration = "nixos-rebuild switch";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    bashrcExtra = ''
      source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      
      bind 'set show-all-if-ambiguous off'
      bind 'TAB:menu-complete'
      bind 'set colored-completion-prefix on'
      bind 'set blink-matching-paren on'
      bind 'set colored-stats on'
      bind 'set expand-tilde on'
      bind 'set mark-directories on'
      bind 'set mark-symlinked-directories on'
      bind 'set visible-stats on'
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

  programs.bat.enable = true;

  programs.mpv.enable = true;

  programs.git = {
    enable = true;
    userName = "Francesco Tabaro";
    userEmail = "francesco.tabaro@gmail.com";
  };

  programs.thunderbird = {
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
        address = "tnrfrnc88@aol.com";
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
}
