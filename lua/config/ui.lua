require("netrw").setup({})

vim.cmd("colorscheme retrobox")

vim.opt.list = true;
vim.opt.listchars = {tab = '··', space='·', trail='\\', nbsp='_', eol='|' }
	
-- cmp style

vim.api.nvim_set_hl(0, 'Pmenu', { bg='#3c3836', fg='#665c55' })

vim.api.nvim_set_hl(0, 'CmpItemMenu', { bg='NONE', fg='#928374' })

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { bg='NONE', fg='#a89984' })

vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='#fb5944', strikethrough=true, fg='#808080' })

vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })

vim.api.nvim_set_hl(0, 'CmpItemKindText', { bg='NONE', fg="#ebdbb2" })

vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#83a598' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindField' })

vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#79740e' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })

vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#fb5944' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { bg='NONE', fg='#427b58' })

vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { bg='NONE', fg='#8f3f71' })

vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { bg='NONE', fg='#fe8019' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link="CmpItemKindStruct" })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { link="CmpItemKindStruct" })

vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { bg='NONE', fg='#fabd2f' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeInterface', { link="CmpItemKindTypeParameter" })


