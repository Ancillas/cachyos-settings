-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    lazyrepo, lazypath
  })
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

-- Leader keys
vim.g.mapleader = "<Space>" 
vim.g.maplocalleader = "\\"

-- =========================================
-- Basic Settings
-- =========================================

-- Tabs / indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse enabled (Shift + drag for terminal selection)
vim.opt.mouse = "a"

-- No system clipboard hijacking
-- (ensure you do NOT set unnamedplus)
vim.opt.clipboard = ""

-- =========================================
-- UX Improvements
-- =========================================

-- Relative numbers in normal mode, absolute in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Center screen after major jumps
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "gg", "ggzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- =========================================
-- Plugins
-- =========================================

require("lazy").setup({
  spec = {
    {
      "sainnhe/sonokai",
      priority = 1000,
      config = function()
        vim.g.sonokai_style = "maia"
        vim.g.sonokai_better_performance = 1

        -- High contrast line numbers (resilient to reload)
        local group = vim.api.nvim_create_augroup("SonokaiOverrides", { clear = true })

        vim.api.nvim_create_autocmd("ColorScheme", {
          group = group,
          pattern = "sonokai",
          callback = function()
            vim.api.nvim_set_hl(0, "LineNr",       { fg = "#e0e0e0" })
            vim.api.nvim_set_hl(0, "LineNrAbove",  { fg = "#c8c8c8" })
            vim.api.nvim_set_hl(0, "LineNrBelow",  { fg = "#c8c8c8" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1f2329" })
          end,
        })

        vim.cmd.colorscheme("sonokai")
      end,
    },

    -- File icons
    {
      "nvim-tree/nvim-web-devicons",
      lazy = true,
    },

    -- File tree
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- Disable netrw (recommended)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
          view = {
            width = 35,
          },
          renderer = {
            highlight_opened_files = "name",
          },
          filters = {
            dotfiles = false,
          },
          git = {
            ignore = false,
          },
       })

        -- Keymap
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
      end,
    },
  },

  install = { colorscheme = { "sonokai", "habamax" } },
  checker = { enabled = true },
})
