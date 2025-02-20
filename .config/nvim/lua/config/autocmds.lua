-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

-- set filetype of .ll files to llvm
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.ll",
  callback = function()
    vim.bo.filetype = "llvm"
  end
})
