require("yatin.core")
require("yatin.lazy")

-- Some extra config that I was too lazy to add in a diff file
vim.opt.conceallevel = 1


function delete_file_swaps()
    vim.cmd('write')
    local output = vim.fn.systemlist('sw')

    if #output > 0 then
        local current_swap_file = output[1]
        local base = current_swap_file:gsub('%.%w+$', '')
        local swap_files = vim.fn.glob(base .. '.s*')

        -- Delete all swap files except the current one
        local swap_files_list = vim.fn.split(swap_files, '\n')
        for _, swap_file in ipairs(swap_files_list) do
            if vim.fn.empty(vim.fn.glob(swap_file)) == 0 and swap_file ~= current_swap_file then
                vim.fn.delete(swap_file)
                print("Swap file removed: " .. swap_file)
            end
        end

        -- Reset swap file extension to `.swp`
        vim.cmd('set swf!')
        vim.cmd('set swf!')
        print("Reset swap file extension for file: " .. vim.fn.expand('%'))
    end
end

vim.cmd('command! DeleteFileSwaps :lua delete_file_swaps()')
