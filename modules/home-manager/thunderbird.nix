{
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
      "mailnews.default_sort_order" = 2;
      "mailnews.default_sort_type" = 18;
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
}
