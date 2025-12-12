{pkgs, ...}: {
	imports = [
		./hardware.nix
		./boot.nix
		./network.nix
		./desktop.nix
		./fonts.nix
		./power.nix
		./user.nix
		./audio.nix
		./dev.nix
	];

	nix = {
		gc = {
			automatic = true;
			dates = "daily";
		};

		settings = {
			experimental-features = [
				"nix-command"
				"flakes"
				"auto-allocate-uids"
				"blake3-hashes"
				"cgroups"
				"git-hashing"
				"verified-fetches"
			];
			system-features = [
				"kvm"
				"uid-range"
			];
			auto-optimise-store = true;
			cores = 0;
			fsync-metadata = true;
			fsync-store-paths = true;
			http-connections = 0;
			preallocate-contents = true;
			use-cgroups = true;
			use-xdg-base-directories = true;
		};
	};

	time.timeZone = "America/Montevideo";

	i18n.defaultLocale = "en_US.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";
	};

	# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		wget2
		curlFull
		gitFull
		helix
		btop-rocm
		alejandra
		python315FreeThreading
		firefox
		nixd
		nil
		openssl
		openssl_oqs
		zlib-ng
		ffmpeg-full
		obs-studio
		zed-editor
		xdg-utils
		xdg-utils-cxx
		vesktop
		nushell
		fastfetch
	];

	programs.nix-ld.enable = true;

	security = {
		sudo = {
			enable = false;
		};
		sudo-rs = {
			enable = true;
			wheelNeedsPassword = false;
			execWheelOnly = true;
		};
	};

	system.stateVersion = "25.11"; # Did you read the comment?
}
