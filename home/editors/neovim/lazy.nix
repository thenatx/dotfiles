{pkgs, ...}: {
  programs.nixvim = {
    plugins.lazy = {
			enable = true;
    	plugins = [
      {
        pkg = pkgs.vimPlugins.lazygit-nvim;
        dependencies = [
          pkgs.vimPlugins.plenary-nvim
        ];
        cmd = [
          "LazyGit"
          "LazyGitConfig"
          "LazyGitCurrentFile"
          "LazyGitFilter"
          "LazyGitFilterCurrentFile"
        ];
      }
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        description = "LazyGit";
      }
    ];
  };
	};
}
