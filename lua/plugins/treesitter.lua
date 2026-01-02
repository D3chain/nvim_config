return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter').setup {
			install_dir = vim.fn.stdpath('data') .. '/site',
			ensure_installed = { "c", "cpp", "shell", "lua", "vimdoc" },
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end,
}
