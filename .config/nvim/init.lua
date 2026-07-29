-- Enable true color support
vim.opt.termguicolors = true

-- Transparent status line with white text
vim.cmd [[
    hi StatusLine guibg=NONE guifg=white
    hi StatusLineNC guibg=NONE guifg=white
]]

-- Transparent background
vim.cmd('set background=dark')
vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Remove (~) characters
vim.opt.fillchars:append({ eob = ' ' })
