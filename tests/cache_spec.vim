if !isdirectory('plenary.nvim')
  !git clone https://github.com/nvim-lua/plenary.nvim.git plenary.nvim
  !git -C plenary.nvim reset --hard 1338bbe8ec6503ca1517059c52364ebf95951458
endif

set runtimepath+=plenary.nvim,.
set noswapfile
set noundofile

lua << EOF
local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
    plugins = {
        all = false,
        treesitter = true,
    },
    colors = {
      my_new_red = "#FF0000",
    },
    highlights = {
      OneDarkPro = { fg = "${my_new_red}" }
    },
})
vim.cmd [[colorscheme onedark]]
EOF

runtime plugin/plenary.vim
command CacheSpec PlenaryBustedFile tests/cache_spec.lua

