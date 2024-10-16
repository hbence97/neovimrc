return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				-- vim.cmd.colorscheme("catppuccin")
			})
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_background = "hard" -- 'hard', 'medium', 'soft'
			vim.g.gruvbox_material_foreground = "material" -- 'material', 'mix', 'original'

			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = false,
		name = "rose-pine",
		config = function()
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
