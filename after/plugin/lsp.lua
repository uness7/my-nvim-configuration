local lsp = require('lsp-zero');

lsp.preset('recommended');

lsp.ensure_installed({
	'eslint',
});

lsp.on_attach(function(client, bufnr)
	print("help");
	local opts = {buffer = bufnr, remap = false};
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts);
end)

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup();
