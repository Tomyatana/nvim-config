return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "vimdoc", "c_sharp", "rust", "lua", "query", "markdown", },
                auto_install = true,
                -- both don't do wel without internet
                ignore_install = {""},
				sync_install = true,
				highlight = { enable = true },
				indent = { enable = true },
                incremental_selection = { enable = true },
            })
		end
	}
}
