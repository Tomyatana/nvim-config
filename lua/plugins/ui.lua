return {
	{
		"catppuccin/nvim", name = "catppuccin",
		config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                dim_inactive = {
                    enabled = true,
                    percentage = 0.75,
                    shade = "dark"
                },
                show_end_of_buffer = true,
                default_integrations = true,
                integrations = {
                    treesitter = true,
                    harpoon = true,
                    mason = true,
                }
            })
            vim.cmd("colorscheme catppuccin")
	    end
	},
	{
		"nvim-tree/nvim-web-devicons",
        opts = {},
    },
    {
        'prichrd/netrw.nvim',
        opts = {},
    },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	}
}
