return {
    "lervag/vimtex",
    lazy = false,

    init = function()
        vim.g.vimtex_leader = "<leader>l"
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
            build_dir = 'build',
            options = {
                '-shell-escape',
                '-verbose',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
            },
        }
        vim.api.nvim_set_keymap('n', '<leader>lv', ':!zathura %:p:h/*.pdf &<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>ll', '<Cmd>VimtexCompile<CR>', { noremap = true, silent = true })
    end,
}
