return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            -- Treesitter
            local config = require("nvim-treesitter.config")
            config.setup({
                install_dir = vim.fn.stdpath('data') .. '/site',
                -- ensure_installed = "all",
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grk",
                        scope_incremental = "grc",
                        node_decremental = "grj",
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        -- lazy = true,
        config = function()
            require("nvim-treesitter.config").setup({
                highlight = { enable = true },
                install_dir = vim.fn.stdpath('data') .. '/site',
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                            ["ai"] = "@conditional.outer",
                            ["ii"] = "@conditional.inner",
                            ["at"] = "@comment.outer",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, --whether to set jumpgs in the jump list
                        -- goto_next_start = {
                        --     ["-f"] = { query = "@function.outer", desc = "Function" },
                        --     ["-c"] = { query = "@class.outer", desc = "Class" },
                        --     ["-l"] = { query = "@loop.outer", desc = "Loop" },
                        --     ["-i"] = { query = "@conditional.outer", desc = "Conditional" },
                        --     ["-t"] = { query = "@comment.outer", desc = "Comment" },
                        --     ["-b"] = { query = "@block.outer", desc = "Block" },
                        --     ["-p"] = { query = "@parameter.outer", desc = "Parameter" },
                        -- },
                        -- goto_next_end = {
                        --     ["#f"] = { query = "@function.outer", desc = "Function" },
                        --     ["#c"] = { query = "@class.outer", desc = "Class" },
                        --     ["#l"] = { query = "@loop.outer", desc = "Loop" },
                        --     ["#i"] = { query = "@conditional.outer", desc = "Conditional" },
                        --     ["#t"] = { query = "@comment.outer", desc = "Comment" },
                        -- },
                        -- goto_previous_start = {
                        --     ["-F"] = { query = "@function.outer", desc = "Function" },
                        --     ["-C"] = { query = "@class.outer", desc = "Class" },
                        --     ["-L"] = { query = "@loop.outer", desc = "Loop" },
                        --     ["-I"] = { query = "@conditional.outer", desc = "Conditional" },
                        --     ["-T"] = { query = "@comment.outer", desc = "Comment" },
                        --     ["-B"] = { query = "@block.outer", desc = "Block" },
                        --     ["-P"] = { query = "@parameter.outer", desc = "Parameter" },
                        -- },
                        -- goto_previous_end = {
                        --     ["#F"] = { query = "@function.outer", desc = "Function" },
                        --     ["#C"] = { query = "@class.outer", desc = "Class" },
                        --     ["#L"] = { query = "@loop.outer", desc = "Loop" },
                        --     ["#I"] = { query = "@conditional.outer", desc = "Conditional" },
                        --     ["#T"] = { query = "@comment.outer", desc = "Comment" },
                        -- }
                    },
                },
            })

            -- NEXT START
            vim.keymap.set({ "n", "x", "o" }, "-f", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-c", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-l", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-i", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-t", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@comment.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-b", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-p", function()
                require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects")
            end)

            -- NEXT END
            vim.keymap.set({ "n", "x", "o" }, "#f", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "#c", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "#l", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "#i", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "#t", function()
                require("nvim-treesitter-textobjects.move").goto_next_end("@comment.outer", "textobjects")
            end)

            -- PREVIOUS START
            vim.keymap.set({ "n", "x", "o" }, "-F", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-C", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-L", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-I", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-T", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@comment.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-B", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "-P", function()
                require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.outer", "textobjects")
            end)

            -- PREVIOUS END
            vim.keymap.set({ "n", "x", "o" }, "#F", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "#C", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "#L", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "#I", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")
            end)

            vim.keymap.set({ "n", "x", "o" }, "#T", function()
                require("nvim-treesitter-textobjects.move").goto_previous_end("@comment.outer", "textobjects")
            end)
        end,
    },
}
