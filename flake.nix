{
	description = "NixOS configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	};

	outputs = {nixpkgs, ...}: {
		nixosConfigurations.deterministic =
			nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [./hosts/deterministic/default.nix];
			};
	};
}
