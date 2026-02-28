-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "sainnhe/sonokai",
      priority = 1000, -- load early
      config = function()
        -- Pick one: 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
        vim.g.sonokai_style = "maia"

       -- Optional knobs (comment out if you don’t care)
        vim.g.sonokai_better_performance = 1
        -- vim.g.sonokai_enable_italic = 1
        -- vim.g.sonokai_disable_italic_comment = 1
        -- vim.g.sonokai_transparent_background = 1

        vim.cmd.colorscheme("sonokai")
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#a0a0a0", bold = false })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#888888" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1e1e2e" })
      end,
    },
  },

  install = { colorscheme = { "sonokai", "habamax" } },
  checker = { enabled = true },
})

-- Tabs
vim.opt.tabstop = 4        -- Visual width of tab character
vim.opt.shiftwidth = 4     -- Indent width
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Smarter auto-indenting

-- Line numbers
vim.opt.number = true         -- Show absolute line number on current line
vim.opt.relativenumber = true -- Show relative numbers on other lines

-- Syntax highlighting
vim.cmd("syntax on")
