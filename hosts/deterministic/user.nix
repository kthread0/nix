{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kptr = {
    isNormalUser = true;
    description = "kptr";
    extraGroups = [
      "networkmanager"
      "wheel"
      "users"
      "video"
      "audio"
      "input"
      "render"
    ];
    packages = with pkgs; [
      zed-editor
    ];
  };
}
