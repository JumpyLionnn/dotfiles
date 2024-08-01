vim.api.nvim_create_autocmd('UiEnter', {
  callback = function()
    require('yazi').setup({
      open_for_directories = true,
      floating_window_scaling_factor = 1.0,
      yazi_floating_window_border = 'none'
    })
    vim.keymap.set('n', '<leader>pv', require('yazi').yazi)
  end,
})

