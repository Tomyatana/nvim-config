return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function ()
			local treesitter = require("nvim-treesitter")

			local parsers = {"c", "rust", "vimdoc", "lua", "query", "markdown", "cpp", "zig", "python"}

			treesitter.setup()
			treesitter.install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function() vim.treesitter.start() end
			})
		end
	}
}
