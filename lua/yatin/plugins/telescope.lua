return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = {"smart"},
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
                file_ignore_patterns = {"^./.git/", "^node_modules/", "^vendor/", "%.jpg", "%.png"},
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc = "Find Files in cwd"})
        keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {desc = "Find by Grep (Live)"})
        keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", {desc = "Find current word"})
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", {desc = "Find recent files"})
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", {desc = "Find todos"})
    end,
}
