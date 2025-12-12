{...}: {
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
			"tss"
		];
	};

	programs.bash.interactiveShellInit = ''
		if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
		  exec nu
		fi
	'';
}
