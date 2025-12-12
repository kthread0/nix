{
	config,
	pkgs,
	...
}: {
	networking = {
		hostName = "deterministic";
		tempAddresses = "default";
		nftables = {
			enable = true;
			checkRuleset = true;
			flushRuleset = true;
		};
		networkmanager = {
			enable = true;
			dns = "systemd-resolved";
		};
		nameservers = [
			"1.1.1.1#one.one.one.one"
			"1.0.0.1#one.one.one.one"
		];
		firewall = {
			enable = true;
			backend = "nftables";
			checkReversePath = "strict";
			filterForward = true;
		};
	};

	services = {
		resolved = {
			enable = true;
			dnssec = "true";
			dnsovertls = "true";
			llmnr = "false";
			domains = ["~."];
			fallbackDns = [
				"1.1.1.1#one.one.one.one"
				"1.0.0.1#one.one.one.one"
			];
		};
	};
}
