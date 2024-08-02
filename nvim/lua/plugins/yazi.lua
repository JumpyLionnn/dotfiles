vim.api.nvim_create_autocmd('UiEnter', {
  callback = function()
    require('yazi').setup({
      open_for_directories = true,
      floating_window_scaling_factor = 1.0,
      yazi_floating_window_border = 'none',
        hooks = {
            yazi_closed_successfully = function(chosen_file, _, _)
                local bufs = vim.api.nvim_list_bufs();
                local buffers_empty = true;
                for _, buf in ipairs(bufs) do
                    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false);
                    if #lines > 1 or lines[1] ~= "" then
                        buffers_empty = false;
                        break;
                    end
                end
                if chosen_file == nil and buffers_empty then
                    vim.cmd("qa")
                end
            end
        }
    })
    vim.keymap.set('n', '<leader>pv', require('yazi').yazi)
  end,
})

