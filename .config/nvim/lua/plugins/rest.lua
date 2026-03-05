return {
    {
        "rest-nvim/rest.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, "http")
            end,
        },
        config = function(_, opts) 
			vim.keymap.set("n", "<leader>hr", ":Rest run<CR>", { desc = "HTTP Run" })
			vim.keymap.set("n", "<leader>hc", ":Rest cookies<CR>", { desc = "HTTP Cookies" })
			vim.keymap.set("n", "<leader>ho", ":Rest open<CR>", { desc = "HTTP Open Results" })
        end,
    }
}
