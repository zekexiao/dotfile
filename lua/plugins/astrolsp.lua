---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@type AstroLSPOpts
	opts = {
		-- Configuration table of features provided by AstroLSP
		features = {
			codelens = true, -- enable/disable codelens refresh on start
			inlay_hints = true, -- enable/disable inlay hints on start
			semantic_tokens = true, -- enable/disable semantic token highlighting
		},
		-- customize lsp formatting options
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					"cpp",
					"c",
					"python",
					"lua",
					"qml",
					"qmljs",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					-- "python",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- disable lua_ls formatting capability if you want to use StyLua to format your lua code
				-- "lua_ls",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- enable servers that you already have installed without mason
		servers = {
			"clangd",
			"qmlls",
		},
		-- customize language server configuration options passed to `lspconfig`
		---@diagnostic disable: missing-fields
		config = {
			clangd = {
				-- disable default protobuf file
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
				cmd = {
					"clangd",
					"-j=12",
					"--clang-tidy",
					"--background-index",
					"--all-scopes-completion",
					"--header-insertion=iwyu",
				},
				capabilities = { offsetEncoding = "utf-8" },
			},
			qmlls = {
				filetypes = { "qml", "qmljs" },
				cmd = {
					"C:\\Qt\\6.8.2\\msvc2022_64\\bin\\qmlls.exe",
				},
			},
		},
		-- mappings to be set up on attaching of a language server
		mappings = {
			n = {
				gh = {
					function()
						vim.cmd("ClangdSwitchSourceHeader")
					end,
					desc = "ClangdSwitchSourceHeader",
				},
			},
		},
		-- A custom `on_attach` function to be run after the default `on_attach` function
		-- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
		on_attach = function(client, bufnr)
			-- this would disable semanticTokensProvider for all clients
			-- client.server_capabilities.semanticTokensProvider = nil
		end,
	},
}
