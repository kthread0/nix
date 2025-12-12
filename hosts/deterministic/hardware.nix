{
	config,
	lib,
	modulesPath,
	...
}: {
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	boot.initrd.availableKernelModules = [
		"xhci_pci"
		"ahci"
		"usbhid"
		"usb_storage"
		"sd_mod"
		"amdgpu"
		"drm"
	];
	boot.initrd.kernelModules = [];
	boot.kernelModules = ["kvm-amd"];
	boot.extraModulePackages = [];

	fileSystems."/" = {
		device = "/dev/mapper/luks-f15e6acc-3fa9-4c6a-88d7-e464861192d9";
		fsType = "ext4";
	};

	boot.initrd.luks.devices."luks-f15e6acc-3fa9-4c6a-88d7-e464861192d9".device = "/dev/disk/by-uuid/f15e6acc-3fa9-4c6a-88d7-e464861192d9";

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/8B5D-93A3";
		fsType = "vfat";
		options = [
			"fmask=0077"
			"dmask=0077"
		];
	};

	swapDevices = [
		{device = "/dev/mapper/luks-fbe22c00-3e4b-4204-9b78-f1ff3bdd7b79";}
	];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
