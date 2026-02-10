-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	event = "BufWinEnter",
-- 	priority = 1000,
-- 	config = function()
-- 		-- Catppuccin Theme
-- 		require("catppuccin").setup()
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
	config = function()
		-- Catppuccin Theme
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
