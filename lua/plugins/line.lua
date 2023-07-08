local tools = require('tools')
return {
	tools.url_replace('nvim-lualine/lualine.nvim'),
	dependencies = {
		tools.url_replace('nvim-tree/nvim-web-devicons'),
	},
	config = function()
		require('lualine').setup()
	end
}
