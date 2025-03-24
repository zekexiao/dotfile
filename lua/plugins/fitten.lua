return {
	"luozhiya/fittencode.nvim",
	opts = {
		use_default_keymaps = false,
		delay_completion = {
			delaytime = 1500,
		},
	},
	specs = {
		{
			"AstroNvim/astrocore",
			opts = {
				options = {
					g = {
						-- set the ai_accept function
						ai_accept = function()
							local fitten = require("fittencode")
							if fitten.has_suggestions() then
								vim.schedule(function()
									fitten.accept_all_suggestions()
								end)
								return true
							end
						end,
					},
				},
			},
		},
	},
}
