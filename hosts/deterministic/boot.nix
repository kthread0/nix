# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
	config,
	pkgs,
	...
}: {
	boot = {
		loader = {
			systemd-boot = {
				enable = true;
			};
			efi = {
				canTouchEfiVariables = true;
			};
		};
		initrd = {
			systemd = {
				enable = true;
				tpm2 = {
					enable = true;
				};
				dbus = {
					enable = true;
				};
			};
		};
	};

	hardware = {
		enableAllFirmware = true;
		enableAllHardware = true;

		cpu = {
			x86 = {
				msr = {
					enable = true;
					settings = {
						allow-writes = "on";
					};
				};
			};
			amd = {
				updateMicrocode = true;
				sev = {
					enable = true;
				};
				sevGuest = {
					enable = true;
				};
				ryzen-smu = {
					enable = true;
				};
			};
		};

		graphics = {
			enable = true;
		};

		amdgpu = {
			initrd = {
				enable = true;
			};
		};
	};

	services = {
		dbus = {
			implementation = "broker";
		};
	};

	boot.kernelPackages = pkgs.linuxPackages_latest;

	boot.initrd.luks.devices."luks-fbe22c00-3e4b-4204-9b78-f1ff3bdd7b79".device = "/dev/disk/by-uuid/fbe22c00-3e4b-4204-9b78-f1ff3bdd7b79";
}
