-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float({
				border = "rounded",
			})
		end, opts)
    end,
})

-- vim.api.nvim_create_autocmd({ 'CmdlineEnter', "CmdlineLeave" }, {
--   group = vim.api.nvim_create_augroup("cmdline-auto-hide", { clear = true }),
--   callback = function(args)
--     local target_height = args.event == 'CmdlineEnter' and 1 or 0
--     if vim.opt_local.cmdheight:get() ~= target_height then
--       vim.opt_local.cmdheight = target_height
--       vim.cmd.redrawstatus()
--     end
--   end,
-- })
