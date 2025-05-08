return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	keys = require("HalliS20.plugins.extra.lspconfig.keys"),

	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		lspconfig.util.default_config.capabilities = capabilities

		local signs = {
			Error = " ",
			Warn = " ",
			Hint = "󰠠 ",
			Info = " ",
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, {
				text = icon,
				texthl = hl,
				numhl = "",
			})
		end

		local attachment = function(client, _)
			-- Disable diagnostics for this client
			client.server_capabilities.diagnosticProvider = false
		end

		lspconfig["html"].setup({ on_attach = attachment })
		lspconfig["cssls"].setup({ on_attach = attachment })
		lspconfig["tailwindcss"].setup({})
		lspconfig["marksman"].setup({})
		lspconfig["templ"].setup({})
		lspconfig["pyright"].setup({})
		lspconfig["elixirls"].setup({ cmd = { "elixir-ls" } })
		lspconfig["gopls"].setup({})
		lspconfig["graphql"].setup({})

		local ft = {
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"javascript",
			"javascriptreact",
			"jsx",
			"tsx",
		}
		lspconfig["ts_ls"].setup({ filetypes = ft })

		ft = { "sh", "zsh", "bash" }
		lspconfig["bashls"].setup({ filetypes = ft })

		ft = {
			"graphql",
			"gql",
			"svelte",
			"typescriptreact",
			"javascriptreact",
		}
		lspconfig["graphql"].setup({ filetypes = ft })

		-- ft = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" }
		-- lspconfig["emmet_ls"].setup({ filetypes = ft })

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, _)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", {
								uri = ctx.file,
							})
						end
					end,
				})
			end,
		})

		lspconfig["clangd"].setup({
			cmd = {
				"clangd",
				"--background-index",
				"--suggest-missing-includes",
				"--clang-tidy",
				"--header-insertion=iwyu",
			},
			filetypes = { "c", "h" }, -- Removed cpp, objc, objcpp, hpp since you're only using C
			root_dir = function(fname)
				return lspconfig.util.root_pattern("compile_commands.json",
				                                   "compile_flags.txt", ".git")(fname) or
					       lspconfig.util.path.dirname(fname)
			end,
			init_options = {
				clangdFileStatus = true,
				usePlaceholders = true,
				completeUnimported = true,
				semanticHighlighting = true,
			},
			on_attach = function(_, bufnr)
				vim.bo[bufnr].tabstop = 4
				vim.bo[bufnr].shiftwidth = 4
				vim.bo[bufnr].expandtab = true
			end,
			capabilities = {
				textDocument = {
					completion = {
						completionItem = { snippetSupport = true },
					},
				},
				offsetEncoding = { "utf-16" },
			},
			flags = { debounce_text_changes = 150 },
			settings = {
				clangd = {
					fallbackFlags = { "-std=c11" }, -- Added C standard
					FormatStyle = {
						BasedOnStyle = "LLVM",
						UseTab = true,
						IndentWidth = 4,
						TabWidth = 4,
					},
				},
			},
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = { globals = { "vim" } },
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
