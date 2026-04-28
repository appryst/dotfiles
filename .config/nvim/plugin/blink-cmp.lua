vim.pack.add({
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("*"),
    },
})

require("blink.cmp").setup({
    fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "super-tab",
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
	},

	cmdline = {
		keymap = { preset = "inherit" },
		completion = { menu = { auto_show = true } },
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})
