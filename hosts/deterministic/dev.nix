{pkgs, ...}: {
	environment.systemPackages = with pkgs; [
		pkg-config
		cargo
		rustc
		rust-bindgen
		rust-cbindgen
		rust-analyzer
		rustfmt
		gcc15Stdenv
		binutils
	];
}
