{...}: {
	services = {
		tuned = {
			enable = true;
			settings = {
				daemon = true;
				reapply_sysctl = true;
				dynamic_tuning = true;
				update_interval = 1;
			};
			ppdSettings = {
				main = {
					default = "performance";
					battery_detection = false;
				};
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
