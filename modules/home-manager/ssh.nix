{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "confirm 1h";
    compression = true;
    forwardAgent = true;
    matchBlocks = {

      "github.com" = {
        host = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_rsa_github";
        forwardX11 = "no";
        forwardX11Trusted = "no";
      };

      "gitlab.com" = {
        host = "gitlab.com";
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/id_gitlab"
          };

        "git.embl.de" = {
          host = "git.embl.de";
          hostname = "git.embl.de";
          identityFile = "~/.ssh/id_gitlab_embl";
          forwardX11 = "no";
          forwardX11Trusted = "no";
        };

        "seneca" = {
          host = "seneca";
          hostname = "seneca.embl.de";
          user = "tabaro";
          identityFile = "~/.ssh/id_embl";
        };

        "login01" = {
          host = "login01";
          hostname = "login01.cluster.embl.de";
          user = "tabaro";
          identityFile = "~/.ssh/id_embl";
        };

        "login02" = {
          host = "login02";
          hostname = "login02.cluster.embl.de";
          user = "tabaro";
          identityFile = "~/.ssh/id_embl";
        };

        "login03" = {
          host = "login03";
          hostname = "login03.cluster.embl.de";
          user = "tabaro";
          identityFile = "~/.ssh/id_embl";
        };

        "login04" = {
          host = "login04";
          hostname = "login04.cluster.embl.de";
          user = "tabaro";
          ientityFile = "~/.ssh/id_embl";
        };

      };

    };

  }
