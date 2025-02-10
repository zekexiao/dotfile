return {
	"yetone/avante.nvim",
	opts = {
		provider = "openai",
		openai = {
			endpoint = "https://api.oaipro.com/v1",
			model = "claude-3-5-sonnet",
			timeout = 2000,
		},
	},
}
