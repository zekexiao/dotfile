require("basic")
require("keymaps")
require("config.lazy")

require("lazy").setup({
	spec = {
		{
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
			"mhartington/formatter.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				dependencies = {
					"rafamadriz/friendly-snippets",
					"saadparwaiz1/cmp_luasnip",
				},
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				config = true,
			},
			{ import = "plugins" },
		},
	},
})

-- snip
require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require("luasnip")
luasnip.config.setup({})

-- cmp
local cmp = require("cmp")

--  lsp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_config = require("lspconfig")
lsp_config.lua_ls.setup({
	capabilities = capabilities,
	diagnostics = {
		globals = { "vim" },
	},
})
lsp_config.clangd.setup({
	capabilities = capabilities,
})
lsp_config.neocmake.setup({
	capabilities = capabilities,
})

-- auto piar
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- completion
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	-- fuck mapping.preset.insert, it will replace <C-p>
	mapping = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-l>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- format
require("formatter").setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
