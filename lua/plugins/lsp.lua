return {
	"neovim/nvim-lspconfig",
	config = function()
		local util = require("lspconfig.util")
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		-- Unify the encoding to fix the warning you had earlier
		capabilities.offsetEncoding = { "utf-16" }
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true
		}

		-- 1. Configure BasedPyright
		vim.lsp.config("basedpyright", {
			install = {
				-- Since you installed via 'uv', we tell it exactly what to call
				cmd = { "basedpyright-langserver", "--stdio" }, 
			},
			filetypes = { "python" },
			root_map = {
				-- New 0.11 style root detection
				["pyproject.toml"] = true,
				["setup.py"] = true,
				[".git"] = true,
			},
			capabilities = capabilities,
			settings = {
				basedpyright = {
					analysis = {
						typeCheckingMode = "strict",
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						autoImportCompletions = true,	
						inlayHints = {
							variableTypes = true, -- Fixed typo: was variableType
							callArgumentNames = true,
							functionReturnTypes = true,
							genericTypes = true,
						},
					},
					python = {
						pythonPath = vim.fn.exepath("python") 
					}
				},
			},
		})

		-- 2. Configure Ruff
		vim.lsp.config("ruff", {
			cmd = { "ruff", "server" },
			filetypes = { "python" },
		})

		-- 3. Enable them
		vim.lsp.enable('basedpyright')
		vim.lsp.enable('ruff')

		-- 4. Single Master Autocmd for Attachments
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf -- Fixed typo from 'bufrn'
				local client = vim.lsp.get_client_by_id(args.data.client_id)

				-- Logic for specific clients
				if client.name == "ruff" then
					-- Disable ruff's hover so it doesn't conflict with basedpyright
					client.server_capabilities.hoverProvider = false
				end

				-- Global LSP Keybindings
				local bufmap = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
				end

				-- Navigation & Info
				bufmap('n', 'gd', vim.lsp.buf.definition)
				bufmap('n', 'gr', vim.lsp.buf.references)
				bufmap('n', 'K',  vim.lsp.buf.hover)
				
				-- Refactoring & Diagnostics
				bufmap('n', '<leader>rn', vim.lsp.buf.rename)
				bufmap('n', '<leader>ca', vim.lsp.buf.code_action)
				bufmap('n', '<leader>e', vim.diagnostic.open_float)
				
				-- Specific for BasedPyright (Organize Imports)
				if client.name == "basedpyright" then
					bufmap('n', '<leader>oi', function() 
						vim.lsp.buf.execute_command({
							command = 'basedpyright.organizeimports', 
							arguments = { vim.uri_from_bufnr(bufnr) }
						})
					end)
				end

				-- Formatting (Explicitly using Ruff)
				bufmap('n', '<leader>gf', function()
					vim.lsp.buf.format({
						filter = function(c) return c.name == "ruff" end,
						bufnr = bufnr,
					})
				end)

				-- Inlay Hint Toggle
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
					bufmap('n', '<leader>th', function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
					end)
				end
			end,
		})
	end,
}
