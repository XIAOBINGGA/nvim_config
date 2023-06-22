local colorscheme = "onedark"
-- -- tokyonight
-- -- OceanicNext
-- -- gruvbox
-- -- zephyr
-- -- nord
-- -- onedark
-- -- nightfox

local status, themes = pcall(require, colorscheme)
if not status then
  vim.notify("没有找" .. colorscheme)
  return
end
-- Lua
themes.setup({
  style = 'warmer'
})
themes.load()
