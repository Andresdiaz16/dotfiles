return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	keys = {
		{ '<leader>pf',
		function()
			require('telescope.builtin').find_files({})
		end
		},
		{'<leader>ps',
		function()
			require('telescope.builtin').live_grep({})
		end
		},
		{'<leader>ss',
		function()
			require('telescope.builtin').grep_string({})
		end
		},
	}
}
