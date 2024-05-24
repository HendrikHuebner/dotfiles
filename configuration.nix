# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
        ./hm-config.nix
        ./hardware-configuration.nix
   ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  console.keyMap = "de";

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.pulseaudio.extraConfig = "unload-module module-suspend-on-idle";
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver.libinput.enable = true;

  # git ssh on startup
  systemd.user.services.git-ssh-agent-init = {
  serviceConfig.PassEnvironment = "DISPLAY";
  script = ''
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/keys/github
    ssh-add ~/.ssh/keys/gitlab
  '';
    wantedBy = [ "multi-user.target" ]; # starts after login
  };

  users.users.hhuebner = {
    isNormalUser = true;
    description = "hhuebner";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
        firefox
        kate
        thunderbird
        jetbrains.clion
        jetbrains.idea-ultimate
        anki-bin    	
        libreoffice-qt
     ];	
  };


  nixpkgs.config.allowUnfree = true;


  environment.systemPackages = with pkgs; [
        wget
        vscode
        git  
        python3
        ruff # python lsp
        python311Packages.pip
        python311Packages.flake8
        python311Packages.python-lsp-server
        htop
        nodejs_21
        cmake
        ninja
        llvmPackages_17.stdenv
        gnumake
        lldb_17
        lld_17
        llvm_17
        clang_17
        clang-tools_17
        (import ./vim-config.nix)
];


hardware.bluetooth.enable = true; # enables support for Bluetooth
hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

# SETTINGS

nix = {
    gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };

    settings.experimental-features = [ "nix-command" "flakes"];
};


# SHELL

users.defaultUserShell = pkgs.zsh; 
users.users.hhuebner.shell = pkgs.zsh; 

programs = {
    zsh = {
 	    shellAliases = {

            rm = "rm -i";
            nixbuild = "sudo nixos-rebuild switch";
            nixconf = "sudo vim /etc/nixos/configuration.nix";
        };  

        enable = true;
        autosuggestions.enable = true;
        zsh-autoenv.enable = true;
        syntaxHighlighting.enable = true;
        ohMyZsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [
                "git"
                "history"
                "deno"
         ];
      };
   };
};

 system.stateVersion = "23.11";

}
