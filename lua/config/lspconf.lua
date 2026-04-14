local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
---@diagnostic disable-next-line: unused-local
local lsp_attach = function(client, bufnr)
    local opts = {
        buffer = bufnr,
    }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

vim.diagnostic.config({
    virtual_text = true;
})

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- none-ls

local null_ls = require('null-ls')

null_ls.setup {
    sources = {
        null_ls.builtins.diagnostics.mypy
    }
}

require('mason-null-ls').setup {
    ensure_installed = {},
    automatic_installation = false
}

-- mason

local mason_lspconfig = require('mason-lspconfig')

require('mason').setup({})
mason_lspconfig.setup({
    ensure_installed = { 'lua_ls' },
    automatic_enable = {
        exclude = {
            "zls",
            "clangd",
			"rust_analyzer",
        }
    }
})

vim.lsp.config("zls", {
    settings = {
        ["zls"] = {
            enable_build_on_save = true,
        }
    }
})

vim.lsp.enable("zls")

vim.lsp.config("clangd", {
	cmd = {
		"clangd", "--header-insertion=never"
	}
})

vim.lsp.enable("clangd")

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust_analyzer"] = {
			useLibraryCodeForTypes = true,
			autoSearchPaths = true,
			autoImportCompletions = false,
			reportMissingImpors = true,
			followImportForHints = true,

			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				command = "cargoo clippy"
			}
		}
	}
})

vim.lsp.enable("rust_analyzer")

vim.lsp.config("hls", {
	filetypes = {"haskell", "lhaskell", "cabal"}
})

vim.lsp.enable("hls")

-- cmp

local cmp = require('cmp')

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

local highlights = {
	CmpItemMenu = { bg='#504945', fg='#928374' },

	CmpItemAbbr = { bg='#504945', fg='#32302f' },

	CmpItemAbbrDeprecated = { bg='#fb5944', strikethrough=true, fg='#808080' },

	CmpItemAbbrMatch = { bg='#504945', fg='#569CD6' },
	CmpItemAbbrMatchFuzzy = { link='CmpIntemAbbrMatch' },

	CmpItemKindText = { bg='#504945', fg="#ebdbb2" },

	CmpItemKindVariable = { bg='#504945', fg='#83a598' },
	CmpItemKindInterface = { link='CmpItemKindVariable' },
	CmpItemKindReference = { link='CmpItemKindVariable' },
	CmpItemKindField = { link='CmpItemKindVariable' },
	CmpItemKindProperty = { link='CmpItemKindField' },

	CmpItemKindFunction = { bg='#504945', fg='#79740e' },
	CmpItemKindMethod = { link='CmpItemKindFunction' },

	CmpItemKindKeyword = { bg='#504945', fg='#fb5944' },
	CmpItemKindUnit = { link='CmpItemKindKeyword' },

	CmpItemKindSnippet = { bg='#504945', fg='#427b58' },

	CmpItemKindConstant = { bg='#504945', fg='#8f3f71' },

	CmpItemKindStruct = { bg='#504945', fg='#fe8019' },
	CmpItemKindEnum = { link="CmpItemKindStruct" },
	CmpItemKindModule = { link="CmpItemKindStruct" },

	CmpItemKindTypeParameter = { bg='#504945', fg='#fabd2f' },
	CmpItemKindTypeInterface = { link="CmpItemKindTypeParameter" },
}

cmp.setup ({
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "nvim_cmp_sign" },
            { name = "nvim_lsp_signature_help" },
        }
    ),
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end),
        ['<C-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end),
	},
	window = {
	    completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = 1,
			side_padding = 0,
			border = "shadow"
		},
	    documentation = cmp.config.window.bordered(),
	},
	view = {
		entries = { name = "custom" }
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},
})
