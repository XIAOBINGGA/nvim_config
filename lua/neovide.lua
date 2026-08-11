if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.print(vim.g.neovide_version)

  --font
  vim.o.guifont = "0xProto Nerd Font:h14" -- text below applies for VimScript

  vim.opt.linespace = 0

  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  -- vim.g.neovide_cursor_vfx_mode = "torpedo"
  vim.g.neovide_cursor_vfx_particle_density = 100.0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_input_ime = true
  vim.g.neovide_hide_mouse_when_typing = true
end
