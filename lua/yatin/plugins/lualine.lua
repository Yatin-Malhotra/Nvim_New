return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons"},

    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        lualine.setup({
            options = {
                icons_enabled = false,
                theme = 'onedark',
            },
        })
    end,

}
