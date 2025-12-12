{pkgs, ...}: {
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

	boot.kernelPackages = pkgs.linuxPackages_zen;

	boot.initrd.luks.devices."luks-fbe22c00-3e4b-4204-9b78-f1ff3bdd7b79".device = "/dev/disk/by-uuid/fbe22c00-3e4b-4204-9b78-f1ff3bdd7b79";

	boot.kernelParams = [
		"accept_memory=eager"
		"acpi=force"
		"acpi_os_name=Linux"
		"acpi_osi=Linux"
		"pcie_aspm=force"
		"iomem=strict"
		"iommu=force"
		"iommu.strict=1"
		"iommu.forcedac=1"
		"io_delay=none"
		"ro"
		"rcutree.kthread_prio=99"
		"realloc"
		"pci=pcie_bus_perf"
		"workqueue.power_efficient=0"
		"amd_pstate=active"
		"amd_iommu=pgtbl_v2"
		"gbpages"
		"threadirqs"
		"preempt=full"
		"lsm=landlock,lockdown,yama,integrity,bpf"
		"slab_nomerge"
		"init_on_alloc=1"
		"randomize_kstack_offset=on"
		"init_on_free=1"
		"page_alloc.shuffle=1"
		"plymouth.use-simpledrm"
		"rng_core.default_quality=1000"
		"pti=on"
		"vsyscall=none"
		"mce=1"
		"audit=1"
		"audit_backlog_limit=8192"
		"loglevel=0"
		"quiet"
		"splash"
		"rd.luks.allow-discards"
		"clocksource.verify_n_cpus=12"
		"tpm_tis.force=1"
		"tpm_crb.force=1"
		"tpm_tis.interrupts=1"
		"reboot=acpi"
		"transparent_hugepage=always"
		"transparent_hugepage_shmem=always"
		"transparent_hugepage_tmpfs=always"
		"hugepage_alloc_threads=12"
		"hugepagesz=2M"
		"hugepages=16"
		"hugepagesz=1G"
		"hugepages=4"
	];

	boot = {
		runSize = "100%";
		devSize = "100%";
		devShmSize = "100%";
		tmp = {
			cleanOnBoot = true;
			tmpfsSize = "100%";
			useTmpfs = true;
			tmpfsHugeMemoryPages = "always";
		};
	};
}
