{ pkgs, ... }:
{
  services = {
    displayManager = {
      cosmic-greeter = {
        enable = true;
      };
    };
    flatpak = {
      enable = true;
    };
    desktopManager = {
      cosmic = {
        enable = true;
        xwayland = {
          enable = true;
        };
      };
    };
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-cosmic
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    cosmic-bg
    cosmic-osd
    cosmic-term
    cosmic-idle
    cosmic-store
    cosmic-randr
    cosmic-panel
    cosmic-icons
    cosmic-files
    cosmic-player
    cosmic-session
    cosmic-greeter
    cosmic-ext-ctl
    cosmic-applets
    cosmic-settings
    cosmic-settings-daemon
    cosmic-launcher
    cosmic-protocols
    cosmic-wallpapers
    cosmic-screenshot
    cosmic-applibrary
    cosmic-notifications
    cosmic-ext-calculator
    cosmic-workspaces-epoch
    cosmic-ext-applet-minimon
  ];
}
