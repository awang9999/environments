# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  home = {
    username = "zander";
    homeDirectory = "/home/zander";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    firefox
    discord
    inkscape-with-extensions
    keepassxc
    kiwix
    prismlauncher
    zoom-us
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Enable and configure Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    shellAliases = {
        rebuild-home = "home-manager switch --flake .#zander@zanderver";
        rebuild-nix = "sudo nixos-rebuild switch --flake .#zander";
        cls = "clear";
        cp = "cp -i";
        mv = "mv -i";
        rm = "rm -iv";
        home = "cd ~";

        # Change directory aliases
        "cd.." = "cd ..";
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        # cd into an old directory
        bd = "cd $OLDPWD";

        # Remove a directory and all files
        rmd = "/bin/rm  --recursive --force --verbose";

        # Alias's for multiple directory listing commands
        la = "ls -Alh"; # show hidden files
        ls = "ls -aFh --color=always"; # add colors and file type extensions
        lx = "ls -lXBh"; # sort by extension
        lk = "ls -lSrh"; # sort by size
        lc = "ls -lcrh"; # sort by change time
        lu = "ls -lurh"; # sort by access time
        lr = "ls -lRh"; # recursive ls
        lt = "ls -ltrh"; # sort by date
        lm = "ls -alh |more"; # pipe through "more"
        lw = "ls -xAh"; # wide listing format
        ll = "ls -Fls"; # long listing format
        labc = "ls -lap"; #alphabetical sort
        lf = "ls -l | egrep -v '^d'"; # files only
        ldir = "ls -l | egrep '^d'"; # directories only

        # alias chmod commands    
        mx = "chmod a+x";
        "000" = "chmod -R 000";
        "644" = "chmod -R 644";
        "666" = "chmod -R 666";
        "755" = "chmod -R 755";
        "777" = "chmod -R 777";

        # Search command line history
        h = "history | grep ";

        # Search running processes
        p = "ps aux | grep ";
        topcpu = "/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10";

        # Search files in the current folder
        f = "find . | grep ";

        # Count all files (recursively) in the current folder
        countfiles = "for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null";

        # To see if a command is aliased, a file, or a built-in command
        checkcommand = "type -t";

        # Show current network connections to the server
        ipview = "netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'";

        # Show open ports
        openports = "netstat -nape --inet";

        # Alias's for safe and forced reboots
        rebootsafe = "sudo shutdown -r now";
        rebootforce = "sudo shutdown -r -n now";

        # Alias's to show disk space and space used in a folder
        diskspace = "du -S | sort -n -r |more";
        folders = "du -h --max-depth=1";
        folderssort = "find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn";
        tree = "tree -CAhF --dirsfirst";
        treed = "tree -CAFd";
        mountedinfo = "df -hT";
    };

    sessionVariables = {
        # Creating a custom prompt!
        # Documentation: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
         NEWLINE = "\n";
         USERANDMACHINE = "%F{green}%n@%m%f";
         TIME = "%F{blue}%*%f";
         CURDIR = "%F{yellow}%3~%f";
         POINTER = "%F{blue}>%f %F{white}";
         VENV = "";
    };

    initExtra = ''
        export PROMPT="(${config.programs.zsh.sessionVariables.TIME})-(${config.programs.zsh.sessionVariables.USERANDMACHINE})-(${config.programs.zsh.sessionVariables.CURDIR})${config.programs.zsh.sessionVariables.NEWLINE}${config.programs.zsh.sessionVariables.POINTER}"
        export EDITOR="emacs"
    '';
    
    history.size = 10000;
    };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
