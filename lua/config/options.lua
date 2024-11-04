-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(opt)
    local fname = vim.api.nvim_buf_get_name(opt.buf)
    if #fname <= 0 then
      return
    end
    local size = vim.fn.getfsize(fname) / 1024
    if size >= 100 then
      vim.schedule(function()
        vim.lsp.buf_detach_client(opt.buf, opt.data.client_id)
      end)
    end
  end,
})

-- vim.g.neovide_window_blurred = true
-- vim.g.neovide_transparency = 0.9
vim.g.neovide_input_macos_alt_is_meta = true
