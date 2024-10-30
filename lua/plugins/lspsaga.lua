return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			finder = {
				default = "ref+imp+def",
				silent = true,
				keys = {
					close = "<esc>",
				},
			},
			definition = {
				keys = {
					close = "<esc>",
				},
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "go", "<cmd>Lspsaga outline<cr>" },
		{ "K", "<cmd>Lspsaga hover_doc<cr>" },
		{ "gd", "<cmd>Lspsaga peek_definition<cr>" },
		{ "ga", "<cmd>Lspsaga code_action<cr>" },
		{ "gr", "<cmd>Lspsaga rename<cr>" },
	},
}
