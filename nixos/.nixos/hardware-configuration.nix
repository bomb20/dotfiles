# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" "acpi_call" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.acpi_call ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/370668d2-a4bb-4ff3-805f-be5fbc193270";
      fsType = "btrfs";
      options = [ "subvol=@nixroot" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/370668d2-a4bb-4ff3-805f-be5fbc193270";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/home/.snapshots" =
    { device = "/dev/disk/by-uuid/370668d2-a4bb-4ff3-805f-be5fbc193270";
      fsType = "btrfs";
      options = [ "subvol=@snapshots/home" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F296-A75C";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}