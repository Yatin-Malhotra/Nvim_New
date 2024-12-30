return {
    "goolord/alpha-nvim",
    event = "VimEnter",

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "YOU ARE THE GREATEST",
            "BELIVE IN YOURSELF AND YOU WILL SUCCEED",
            "CHASE EXCELLENCE, NOT SUCCESS...",
            "SUCCESS WILL FOLLOW",
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "New File", "<cmd>ene<CR>"),
            dashboard.button("<leader>ee", "Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("<leader>ff", "Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("<leader>fg", "Find Grep", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("<leader>wr", "Restore Session for Current Dir", "<cmd>SessionRestore<CR>"),
            dashboard.button("q", "Quit Nvim", "<cmd>qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    end,
}
