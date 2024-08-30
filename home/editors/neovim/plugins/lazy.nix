{ pkgs }: {
  enable = true;
	plugins = [
		{
			pkg = import ./cord.nix {inherit pkgs;};
			cmd = [
				"CordConnect"
				"CordDisconnect"
				"CordHidePresence"
				"CordIdle"
				"CordReconnect"
				"CordShowPresence"
				"CordToggleIdle"
				"CordTogglePresence"
				"CordUnidle"
				"CordWorkspace"
			];
		}
	];
}
