local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')
packer.util = require('packer.util')

packer.init({
  compile_path  = packer.util.join_paths(vim.fn.stdpath('data'), 'plugin', 'packer_compiled.lua'),
})


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-ui-select.nvim' }

  use { "catppuccin/nvim", as = "catppuccin" }

  use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })
  use { "numToStr/Comment.nvim" }

  use {
          "williamboman/mason.nvim"
  }
  use { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" }
end)
