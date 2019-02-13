# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Cryptodisk stuff
  boot.initrd.luks.devices.crypted.device = "/dev/sda2";
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  swapDevices = [ { device = "/dev/luksvg/swaplv"; }];

  networking.hostName = "nein"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables working.netwireless support via wpa_supplicant.
  networking.networkmanager = {
    enable = true;
    wifi.scanRandMacAddress = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget vim alacritty gnome3.networkmanagerapplet firefox neovim x11_ssh_askpass
    neomutt qutebrowser dmenu pass compton gajim tdesktop pandoc nodejs mosh nmap
    zathura numix-cursor-theme numix-gtk-theme numix-icon-theme stow
    git pasystray cbatticon blueman haskellPackages.stack haskellPackages.ghc
    borgbackup taskwarrior ubuntu_font_family xorg.xcursorthemes neomutt offlineimap
    lynx htop khal khard vdirsyncer libgnome-keyring gnome3.gnome-keyring
    nextcloud-client fzf entr pdfpc redshift blueman acpi usbutils pciutils
    displaycal brightnessctl maven exa texlive.combined.scheme-medium p7zip killall
    apache-directory-studio bluez bluez-tools darktable gimp xsane
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  programs.zsh.enable = true;
  programs.slock.enable = true;
  programs.java.enable = true;
  programs.adb.enable = true;

  hardware.brightnessctl.enable = true;
  hardware.sane.enable = true;
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "caps:swapescape";
  services.xserver.xkbVariant = "altgr-intl";
  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver.windowManager.awesome.enable = true;
  services.xserver.displayManager.lightdm = {
    enable = true;
    autoLogin = {
      enable = true;
      user = "vincent";
      timeout = 0;
    };
  };

  # Enable touchpad support.
  services.xserver.libinput = {
    enable = true;
    clickMethod = "none";
    tapping = false;
    disableWhileTyping = true;
  };

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
    

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };
  users.users.vincent = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "adbusers" "scanner"];
    shell = pkgs.zsh;
  };

  services.snapper.configs.home = {
    subvolume = "/home";
    extraConfig = ''
      ALLOW_USERS="vincent"
      TIMELINE_CREATE="yes"
      TIMELINE_CLEANUP="yes"
      TIMELINE_LIMIT_HOURLY="12"
      TIMELINE_LIMIT_DAILY="7"
      TIMELINE_LIMIT_WEEKLY="4"
      TIMELINE_LIMIT_MONTHLY="6"
      TIMELINE_LIMIT_YEARLY="0"
    '';
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?

}
