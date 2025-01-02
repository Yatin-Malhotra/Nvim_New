return {
    "goolord/alpha-nvim",
    event = "VimEnter",

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            " /$$    /$$          /$$     /$$         ",
            "|  $$  /$$/         | $$    |__/         ",
            "\\  $$ /$$//$$$$$$  /$$$$$$   /$$ /$$$$$$$ ",
            " \\  $$$$/|____  $$|_  $$_/  | $$| $$__  $$",
            "  \\  $$/  /$$$$$$$  | $$    | $$| $$  \\ $$",
            "   | $$  /$$__  $$  | $$ /$$| $$| $$  | $$",
            "   | $$ |  $$$$$$$  |  $$$$/| $$| $$  | $$",
            "   |__/  \\_______/   \\___/  |__/|__/  |__/",
            "                                          ",
            "                                          ",
            "         Chase Excellence, not Success    ",
            "             Success will follow          ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "New File", "<cmd>ene<CR>"),
            dashboard.button("<leader>ee", "Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("<leader>ff", "Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("<leader>fg", "Find Grep", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("<leader>wr", "Restore Session for Current Dir", "<cmd>SessionRestore<CR>"),
            dashboard.button("q", "Quit Nvim", "<cmd>qa<CR>"),
        }

        dashboard.section.footer.val = {
            "Inspired by the pursuit of excellence.",
        }

        -- Apply custom highlights
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#50fa7b", bold = true })   -- Header in pink
        vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#ff79c6", bold = true })  -- Buttons in cyan
        vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#ff79c6", italic = true }) -- Footer/quote in green

        -- Assign highlights to sections
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        alpha.setup(dashboard.opts)

        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
