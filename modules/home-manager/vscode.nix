{ pkgs, ... }: with pkgs; {
  programs.vscode = {
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
      "editor.fontSize" = 13;
      "editor.lineHeight" = 1.25;
      "editor.rulers" = [ 80 120 ];
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "terminal.integrated.fontFamily" = "Hack Nerd Font Mono";
      "terminal.integrated.fontSize" = 13;
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

}
