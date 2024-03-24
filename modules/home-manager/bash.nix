{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    bashrcExtra = ''
      # source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      
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
}
