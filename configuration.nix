# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enabling Flakes

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Networking

  networking.hostName = ""; # Define your own hostname 
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Dublin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_IE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Cinnamon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.

  hardware.pulseaudio.enable = false;

  # Enable Bluetooth

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.exampleName = {
    isNormalUser = true;
    description = ""; # Set own name
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ # user defined packages
    ];
  };

  # Enabling flatpaks - If possible pls dont use them just ask me what to do instead

  services.flatpak.enable = true;

  # Install firefox.
  programs.firefox = { # Limited options for firefox config

  enable = true;

  };


  # Install Programming editors

  programs.neovim = { # Planning on Making neovim completely nix configured
  enable = true;
  };


  # Window Manager

  programs.hyprland = { # Simple default hyprland, will include simple config
	enable = true;

  };

  # Terminal Multiplexer

  programs.tmux = {
  	enable = true;
	keyMode = "vi";


  };

  # Shell in use 
  programs.fish = {
  enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # Administrator Things
    wget # Not needed much, another curl alternative
    fastfetch # Style!
    git # Will need for project management
    kitty # Main terminal Emulator, will provide config for it
    tk # For eduroam install

    # Gui apps
    spotify # Music yipee
    obsidian # Best note taking app - Notion can also be installed via snap or used within the browser
    # google-chrome # For senan lol
    
    # General Compilers/Interpreters

    python3 # Python always needed at some point lol
    
    # Object oriented Programming 

    jdk # Standard up to date jdk - comment out for nosql
    
    # NoSQL Data Architecture
    # jdk8 # uncomment for use in nosql
    nodejs_22 # God forbid we need to do any more webdev
    neo4j



    # Hyprland config dependencies

    grim
    slurp
    brightnessctl
    waybar
    hyprpaper
  ];
  # Nerd font used 
 fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
