{pkgs, ...}: {
	fonts = {
		packages = with pkgs; [
			noto-fonts
			noto-fonts-lgc-plus
			noto-fonts-cjk-serif
			noto-fonts-color-emoji
			liberation_ttf
			nerd-fonts.jetbrains-mono
		];
		enableDefaultPackages = true;
		enableGhostscriptFonts = true;
		fontDir = {
			enable = true;
			decompressFonts = true;
		};
		fontconfig = {
			enable = true;
			useEmbeddedBitmaps = true;
			subpixel = {
				rgba = "rgb";
				lcdfilter = "default";
			};
			hinting = {
				enable = true;
				style = "slight";
			};
			defaultFonts = {
				serif = ["Liberation Serif"];
				sansSerif = ["Liberation Sans"];
				emoji = ["Noto Color Emoji"];
				monospace = ["JetBrainsMono Nerd Font"];
			};
		};
	};
}
