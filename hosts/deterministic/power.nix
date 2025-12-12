{...}: {
	services = {
		tlp = {
			settings = {
				TLP_ENABLE = 1;
				TLP_DEFAULT_MODE = "AC";
				TLP_PERSISTENT_DEFAULT = 1;

				DISK_IDLE_SECS_ON_AC = 0;
				DISK_IDLE_SECS_ON_BAT = 0;

				CPU_DRIVER_OPMODE_ON_AC = "active";
				CPU_DRIVER_OPMODE_ON_BAT = "active";

				CPU_SCALING_GOVERNOR_ON_AC = "performance";
				CPU_SCALING_GOVERNOR_ON_BAT = "performance";

				CPU_SCALING_MIN_FREQ_ON_AC = 4762528;
				CPU_SCALING_MAX_FREQ_ON_AC = 4762528;
				CPU_SCALING_MIN_FREQ_ON_BAT = 4762528;
				CPU_SCALING_MAX_FREQ_ON_BAT = 4762528;

				PLATFORM_PROFILE_ON_AC = "performance";
				PLATFORM_PROFILE_ON_BAT = "performance";

				DISK_DEVICES = "sda sdb";

				DISK_APM_LEVEL_ON_AC = "255 255";
				DISK_APM_LEVEL_ON_BAT = "255 255";

				DISK_SPINDOWN_TIMEOUT_ON_AC = "0 0";
				DISK_SPINDOWN_TIMEOUT_ON_BAT = "0 0";

				DISK_IOSCHED = "kyber kyber";

				SATA_LINKPWR_ON_AC = "max_performance";
				SATA_LINKPWR_ON_BAT = "max_performance";

				AHCI_RUNTIME_PM_ON_AC = "on";
				AHCI_RUNTIME_PM_ON_BAT = "on";

				AHCI_RUNTIME_PM_TIMEOUT = 0;

				RADEON_DPM_PERF_LEVEL_ON_AC = "high";
				RADEON_DPM_PERF_LEVEL_ON_BAT = "high";

				AMDGPU_ABM_LEVEL_ON_AC = 0;
				AMDGPU_ABM_LEVEL_ON_BAT = 0;

				WOL_DISABLE = "Y";

				SOUND_POWER_SAVE_ON_AC = 0;
				SOUND_POWER_SAVE_ON_BAT = 0;

				SOUND_POWER_SAVE_CONTROLLER = "N";

				PCIE_ASPM_ON_AC = "performance";
				PCIE_ASPM_ON_BAT = "performance";

				RUNTIME_PM_ON_AC = "on";
				RUNTIME_PM_ON_BAT = "on";

				USB_AUTOSUSPEND = 0;
			};
		};

		acpid = {
			enable = true;
			logEvents = true;
		};

		upower = {
			enable = true;
		};

		udisks2 = {
			enable = true;
		};
	};
}
