return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"p00f/clangd_extensions.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						-- 可以选择禁用原来的快捷键
						["<C-n>"] = false,
						["<C-p>"] = false,
					},
				},
			},
		})
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--exclude", ".clangd" },
				})
			end,
		},
		{ "gs", "<cmd>Telescope lsp_document_symbols<cr>" },
		{ "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<cr>" },
		{ "gh", "<cmd>ClangdSwitchSourceHeader<cr>" },
	},
}
