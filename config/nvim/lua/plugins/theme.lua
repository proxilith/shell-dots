local neopywal = require("neopywal")
neopywal.setup()

require("neopywal").setup({
    colorscheme_file = "~/.config/nvim/",
    transparent_background = true,
    dim_inactive = false,
    terminal_colors = true,
    show_end_of_buffer = false,
    default_fileformats = true,
    default_plugins = true,
})
vim.cmd.colorscheme("neopywal")
