return {
				"neovim/nvim-lspconfig",
				event = {"BufReadPre", "BufNewFile"},
				dependencies = {
								"hrsh7th/cmp-nvim-lsp",
								{"antosha417/nvim-lsp-file-operations", config = true},
				},
				config = function()
								-- import lspconfig plugin
								local lspconfig = require("lspconfig")

								-- import cmp-nvim-lsp plugin
								local cmp_nvim_lsp = require("cmp_nvim_lsp")

								local keymap = vim.keymap -- for conciseness

								local opts = {noremap = true, silent = true}
								local on_attach = function(client, bufnr)
												opts.buffer = bufnr

												-- set keybinds
												opts.desc = "Show LSP references"
												keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

												opts.desc = "Go to declaration"
												keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

												opts.desc = "Show LSP definitions"
												keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

												opts.desc = "Show LSP implementations"
												keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

												opts.desc = "Show LSP type definitions"
												keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
												           opts) -- show lsp type definitions

												opts.desc = "See available code actions"
												keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

												opts.desc = "Smart rename"
												keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

												opts.desc = "Show buffer diagnostics"
												keymap.set("n", "<leader>D",
												           "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

												opts.desc = "Show line diagnostics"
												keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

												opts.desc = "Go to previous diagnostic"
												keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

												opts.desc = "Go to next diagnostic"
												keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

												opts.desc = "Show documentation for what is under cursor"
												keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

												opts.desc = "Restart LSP"
												keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

												----------------------------------- GOTO PREVIEW -----------------------------------
												opts.desc = "goto preview definition"
												keymap.set("n", "gp",
												           "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
												           opts) -- show lsp definitions

												opts.desc = "goto preview implementation"
												keymap.set("n", "gpi",
												           "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
												           opts) -- show lsp implementations

												opts.desc = "goto preview type definition"
												keymap.set("n", "gpt",
												           "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
												           opts) -- show lsp type definitions

												opts.desc = "goto preview references"
												keymap.set("n", "gpr",
												           "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
												           opts) -- show lsp references

												opts.desc = "goto preview close all"
												keymap.set("n", "gpc",
												           "<cmd>lua require('goto-preview').close_all_win()<CR>",
												           opts) -- show lsp references
								end

								-- used to enable autocompletion (assign to every lsp server config)
								local capabilities = cmp_nvim_lsp.default_capabilities()

								-- Change the Diagnostic symbols in the sign column (gutter)
								-- (not in youtube nvim video)
								local signs = {
												Error = " ",
												Warn = " ",
												Hint = "󰠠 ",
												Info = " ",
								}
								for type, icon in pairs(signs) do
												local hl = "DiagnosticSign" .. type
												vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
								end

								lspconfig["bashls"].setup({
												capabilities = capabilities,
												on_attach = on_attach,
												filetypes = {"sh", "zsh", "bash"},
								})

								lspconfig["clangd"].setup({
												cmd = {
																"clangd",
																"--background-index",
																"--suggest-missing-includes",
																"--clang-tidy",
																"--header-insertion=iwyu",
																"--completion-style=detailed",
																"--function-arg-placeholders",
												},
												filetypes = {"c", "cpp", "objc", "objcpp", "hpp", "h"},
												root_dir = function(fname)
																return lspconfig.util.root_pattern("compile_commands.json",
																                                   "compile_flags.txt", ".git")(
																				       fname) or lspconfig.util.path.dirname(fname)
												end,
												init_options = {
																clangdFileStatus = true,
																usePlaceholders = true,
																completeUnimported = true,
																semanticHighlighting = true,
												},
												on_attach = function(client, bufnr)
																-- Set options for the current buffer
																vim.bo[bufnr].tabstop = 4
																vim.bo[bufnr].shiftwidth = 4
																vim.bo[bufnr].expandtab = true
												end,
												capabilities = {
																textDocument = {
																				completion = {completionItem = {snippetSupport = true}},
																},
																offsetEncoding = {"utf-16"}, -- Set offset encoding here
												},
												flags = {debounce_text_changes = 150},
												settings = {
																clangd = {
																				-- fallbackFlags = { "-std=c++17" },
																				FormatStyle = {
																								BasedOnStyle = "LLVM",
																								UseTab = true,
																								IndentWidth = 4,
																								TabWidth = 4,
																				}, -- Set tab size to 4 here
																},
												},
								})
								-- configure lua server (with special settings)
								lspconfig["lua_ls"].setup({
												capabilities = capabilities,
												on_attach = on_attach,
												settings = { -- custom settings for lua
																Lua = {
																				-- make the language server recognize "vim" global
																				diagnostics = {globals = {"vim"}},
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
