local blend = require('rose-pine.util').blend

local M = {}

function M.get(config)
	local p = require('rose-pine.palette')

	local theme = {}
	local groups = config.groups or {}
	local styles = {
		italic = (config.disable_italics and p.none) or 'italic',
		vert_split = (config.bold_vert_split and groups.border) or p.none,
		background = (config.disable_background and p.none)
			or groups.background,
		float_background = (config.disable_float_background and p.none)
			or groups.panel,
	}
	styles.nc_background = (config.dim_nc_background and groups.panel)
		or styles.background

	theme = {
		ColorColumn = { bg = p.overlay },
		Conceal = { bg = p.none },
		CurSearch = { link = 'IncSearch' },
		-- Cursor = {},
		CursorColumn = { bg = p.highlight_low },
		-- CursorIM = {},
		CursorLine = { bg = p.highlight_low },
		CursorLineNr = { fg = p.text },
		DarkenedPanel = { bg = groups.panel },
		DarkenedStatusline = { bg = groups.panel },
		DiffAdd = { bg = blend(groups.git_add, groups.background, 0.2) },
		DiffChange = { bg = p.overlay },
		DiffDelete = { bg = blend(groups.git_delete, groups.background, 0.2) },
		DiffText = { bg = blend(groups.git_text, groups.background, 0.2) },
		diffAdded = { link = 'DiffAdd' },
		diffChanged = { link = 'DiffChange' },
		diffRemoved = { link = 'DiffDelete' },
		Directory = { fg = p.foam, bg = p.none },
		-- EndOfBuffer = {},
		ErrorMsg = { fg = p.love, style = 'bold' },
		FloatBorder = { fg = groups.border },
		FloatTitle = { fg = p.muted },
		FoldColumn = { fg = p.muted },
		Folded = { fg = p.text, bg = groups.panel },
		IncSearch = { fg = p.base, bg = p.rose },
		LineNr = { fg = p.muted },
		MatchParen = { fg = p.text, bg = p.highlight_med },
		ModeMsg = { fg = p.subtle },
		MoreMsg = { fg = p.iris },
		NonText = { fg = p.muted },
		Normal = { fg = p.text, bg = styles.background },
		NormalFloat = { fg = p.text, bg = styles.float_background },
		NormalNC = { fg = p.text, bg = styles.nc_background },
		NvimInternalError = { fg = '#ffffff', bg = p.love },
		Pmenu = { fg = p.subtle, bg = styles.float_background },
		PmenuSbar = { bg = p.highlight_low },
		PmenuSel = { fg = p.text, bg = p.overlay },
		PmenuThumb = { bg = p.highlight_med },
		Question = { fg = p.gold },
		-- QuickFixLine = {},
		-- RedrawDebugNormal = {}
		RedrawDebugClear = { fg = '#ffffff', bg = p.gold },
		RedrawDebugComposed = { fg = '#ffffff', bg = p.pine },
		RedrawDebugRecompose = { fg = '#ffffff', bg = p.love },
		Search = { bg = p.highlight_med },
		SpecialKey = { fg = p.foam },
		SpellBad = { sp = p.subtle, style = 'undercurl' },
		SpellCap = { sp = p.subtle, style = 'undercurl' },
		SpellLocal = { sp = p.subtle, style = 'undercurl' },
		SpellRare = { sp = p.subtle, style = 'undercurl' },
		SignColumn = { fg = p.text, bg = styles.background },
		StatusLine = { fg = p.subtle, bg = styles.float_background },
		StatusLineNC = { fg = p.muted, bg = styles.background },
		StatusLineTerm = { link = 'StatusLine' },
		StatusLineTermNC = { link = 'StatusLineNC' },
		TabLine = { fg = p.subtle, bg = styles.float_background },
		TabLineFill = { bg = styles.float_background },
		TabLineSel = { fg = p.text, bg = p.overlay },
		Title = { fg = p.text },
		VertSplit = { fg = groups.border, bg = styles.vert_split },
		Visual = { bg = p.highlight_med },
		-- VisualNOS = {},
		WarningMsg = { fg = p.gold },
		-- Whitespace = {},
		WildMenu = { link = 'IncSearch' },

		Boolean = { fg = p.rose },
		Character = { fg = p.gold },
		Comment = { fg = groups.comment, style = styles.italic },
		Conditional = { fg = p.pine },
		Constant = { fg = p.gold },
		Debug = { fg = p.rose },
		Define = { fg = p.iris },
		Delimiter = { fg = p.subtle },
		Error = { fg = p.love },
		Exception = { fg = p.pine },
		Float = { fg = p.gold },
		Function = { fg = p.rose },
		Identifier = { fg = p.rose },
		-- Ignore = {},
		Include = { fg = p.iris },
		Keyword = { fg = p.pine },
		Label = { fg = p.foam },
		Macro = { fg = p.iris },
		Number = { fg = p.gold },
		Operator = { fg = p.subtle },
		PreCondit = { fg = p.iris },
		PreProc = { fg = p.iris },
		Repeat = { fg = p.pine },
		Special = { fg = p.rose },
		SpecialChar = { fg = p.rose },
		SpecialComment = { fg = p.iris },
		Statement = { fg = p.pine },
		StorageClass = { fg = p.foam },
		String = { fg = p.gold },
		Structure = { fg = p.foam },
		Tag = { fg = p.rose },
		Todo = { fg = p.iris },
		Type = { fg = p.foam },
		Typedef = { fg = p.foam },
		Underlined = { style = 'underline' },

		htmlArg = { fg = p.iris },
		htmlBold = { style = 'bold' },
		htmlEndTag = { fg = p.subtle },
		htmlH1 = { fg = groups.headings.h1, style = 'bold' },
		htmlH2 = { fg = groups.headings.h2, style = 'bold' },
		htmlH3 = { fg = groups.headings.h3, style = 'bold' },
		htmlH4 = { fg = groups.headings.h4, style = 'bold' },
		htmlH5 = { fg = groups.headings.h5, style = 'bold' },
		htmlItalic = { style = styles.italic },
		htmlLink = { fg = groups.link },
		htmlTag = { fg = p.subtle },
		htmlTagN = { fg = p.text },
		htmlTagName = { fg = p.foam },

		markdownDelimiter = { fg = p.subtle },
		markdownH1 = { fg = groups.headings.h1, style = 'bold' },
		markdownH1Delimiter = { link = 'markdownH1' },
		markdownH2 = { fg = groups.headings.h2, style = 'bold' },
		markdownH2Delimiter = { link = 'markdownH2' },
		markdownH3 = { fg = groups.headings.h3, style = 'bold' },
		markdownH3Delimiter = { link = 'markdownH3' },
		markdownH4 = { fg = groups.headings.h4, style = 'bold' },
		markdownH4Delimiter = { link = 'markdownH4' },
		markdownH5 = { fg = groups.headings.h5, style = 'bold' },
		markdownH5Delimiter = { link = 'markdownH5' },
		markdownH6 = { fg = groups.headings.h6, style = 'bold' },
		markdownH6Delimiter = { link = 'markdownH6' },
		markdownLinkText = { fg = groups.link, style = 'underline' },
		markdownUrl = { link = 'markdownLinkText' },

		mkdCode = { fg = p.foam, style = styles.italic },
		mkdCodeDelimiter = { fg = p.rose },
		mkdCodeEnd = { fg = p.foam },
		mkdCodeStart = { fg = p.foam },
		mkdFootnotes = { fg = p.foam },
		mkdID = { fg = p.foam, style = 'underline' },
		mkdInlineURL = { fg = groups.link, style = 'underline' },
		mkdLink = { link = 'mkdInlineURL' },
		mkdLinkDef = { link = 'mkdInlineURL' },
		mkdListItemLine = { fg = p.text },
		mkdRule = { fg = p.subtle },
		mkdURL = { link = 'mkdInlineURL' },

		DiagnosticError = { fg = groups.error },
		DiagnosticHint = { fg = groups.hint },
		DiagnosticInfo = { fg = groups.info },
		DiagnosticWarn = { fg = groups.warn },
		DiagnosticDefaultError = { fg = groups.error },
		DiagnosticDefaultHint = { fg = groups.hint },
		DiagnosticDefaultInfo = { fg = groups.info },
		DiagnosticDefaultWarn = { fg = groups.warn },
		DiagnosticFloatingError = { fg = groups.error },
		DiagnosticFloatingHint = { fg = groups.hint },
		DiagnosticFloatingInfo = { fg = groups.info },
		DiagnosticFloatingWarn = { fg = groups.warn },
		DiagnosticSignError = { fg = groups.error },
		DiagnosticSignHint = { fg = groups.hint },
		DiagnosticSignInfo = { fg = groups.info },
		DiagnosticSignWarn = { fg = groups.warn },
		DiagnosticStatusLineError = { fg = groups.error, bg = groups.panel },
		DiagnosticStatusLineHint = { fg = groups.hint, bg = groups.panel },
		DiagnosticStatusLineInfo = { fg = groups.info, bg = groups.panel },
		DiagnosticStatusLineWarn = { fg = groups.warn, bg = groups.panel },
		DiagnosticUnderlineError = { sp = groups.error, style = 'undercurl' },
		DiagnosticUnderlineHint = { sp = groups.hint, style = 'undercurl' },
		DiagnosticUnderlineInfo = { sp = groups.info, style = 'undercurl' },
		DiagnosticUnderlineWarn = { sp = groups.warn, style = 'undercurl' },
		DiagnosticVirtualTextError = { fg = groups.error },
		DiagnosticVirtualTextHint = { fg = groups.hint },
		DiagnosticVirtualTextInfo = { fg = groups.info },
		DiagnosticVirtualTextWarn = { fg = groups.warn },

		-- healthcheck
		healthError = { fg = groups.error },
		healthSuccess = { fg = groups.info },
		healthWarning = { fg = groups.warn },

		-- TSAttribute = {},
		TSBoolean = { link = 'Boolean' },
		TSCharacter = { link = 'Character' },
		TSComment = { link = 'Comment' },
		TSConditional = { link = 'Conditional' },
		TSConstBuiltin = { fg = p.love },
		-- TSConstMacro = {},
		TSConstant = { fg = p.foam },
		TSConstructor = { fg = p.foam },
		-- TSEmphasis = {},
		-- TSError = {},
		-- TSException = {},
		TSField = { fg = p.foam },
		-- TSFloat = {},
		TSFuncBuiltin = { fg = p.love },
		-- TSFuncMacro = {},
		TSFunction = { fg = p.rose },
		TSInclude = { fg = p.pine },
		TSKeyword = { fg = p.pine },
		-- TSKeywordFunction = {},
		TSKeywordOperator = { fg = p.subtle },
		TSLabel = { fg = p.foam },
		-- TSLiteral = {},
		-- TSMethod = {},
		-- TSNamespace = {},
		-- TSNone = {},
		TSNumber = { link = 'Number' },
		TSOperator = { fg = p.subtle },
		TSParameter = { fg = p.iris, style = styles.italic },
		-- TSParameterReference = {},
		TSProperty = { fg = p.iris, style = styles.italic },
		TSPunctBracket = { fg = groups.punctuation },
		TSPunctDelimiter = { fg = groups.punctuation },
		TSPunctSpecial = { fg = groups.punctuation },
		-- TSRepeat = {},
		-- TSStrike = {},
		TSString = { link = 'String' },
		TSStringEscape = { fg = p.pine },
		-- TSStringRegex = {},
		TSStringSpecial = { link = 'TSString' },
		-- TSSymbol = {},
		TSTag = { fg = p.foam },
		TSTagDelimiter = { fg = p.subtle },
		TSText = { fg = p.text },
		TSTitle = { fg = groups.headings.h1, style = 'bold' },
		TSType = { link = 'Type' },
		-- TSTypeBuiltin = {},
		TSURI = { fg = groups.link },
		-- TSUnderline = {},
		TSVariable = { fg = p.text, style = styles.italic },
		TSVariableBuiltin = { fg = p.love },

		-- Treesitter
		['@annotation'] = { link = 'PreProc' },
		['@attribute'] = { link = 'PreProc' },
		['@boolean'] = { link = 'Boolean' },
		['@character'] = { link = 'Character' },
		['@comment'] = { link = 'Comment' },
		['@conditional'] = { link = 'Conditional' },
		['@constant'] = { fg = p.foam },
		['@constant.builtin'] = { fg = p.love },
		['@constructor'] = { fg = p.foam },
		['@field'] = { fg = p.foam },
		['@function'] = { fg = p.rose },
		['@function.builtin'] = { fg = p.love },
		['@function.call'] = { fg = p.foam, style = 'bold' },
		['@include'] = { fg = p.pine },
		['@keyword'] = { fg = p.pine },
		['@keyword.operator'] = { fg = p.subtle },
		['@label'] = { fg = p.foam },
		['@namespace'] = { link = 'Include' },
		['@number'] = { link = 'Number' },
		['@float'] = { link = 'Number' },
		['@operator'] = { fg = p.subtle },
		['@parameter'] = { fg = p.iris, style = styles.italic },
		['@property'] = { fg = p.iris, style = styles.italic },
		['@punctuation.bracket'] = { fg = groups.punctuation },
		['@punctuation.delimiter'] = { fg = groups.punctuation },
		['@punctuation.special'] = { fg = groups.punctuation },
		['@string'] = { link = 'String' },
		['@string.escape'] = { fg = p.pine },
		['@string.special'] = { link = '@string' },
		['@symbol'] = { link = 'Identifier' },
		['@tag'] = { fg = p.foam },
		['@tag.attribute'] = { link = '@property' },
		['@tag.delimiter'] = { fg = p.subtle },
		['@text'] = { fg = p.text },
		['@text.strong'] = { style = 'bold', bold = true },
		['@text.emphasis'] = { italic = true },
		['@text.underline'] = { underline = true },
		['@text.strike'] = { strikethrough = true },
		['@text.math'] = { link = 'Special' },
		['@text.environment'] = { link = 'Macro' },
		['@text.environment.name'] = { link = 'Type' },
		['@text.title'] = { fg = groups.headings.h1, style = 'bold' },
		['@text.uri'] = { fg = groups.link },
		['@text.note'] = { link = 'SpecialComment' },
		['@text.warning'] = { link = 'Todo' },
		['@text.danger'] = { link = 'WarningMsg' },
		['@todo'] = { link = 'Todo' },
		['@type'] = { link = 'Type' },
		['@variable'] = { fg = p.text, style = styles.italic },
		['@variable.builtin'] = { fg = p.love },
		['@variable.global'] = { fg = p.love },

		-- vim.lsp.buf.document_highlight()
		LspReferenceText = { bg = p.highlight_med },
		LspReferenceRead = { bg = p.highlight_med },
		LspReferenceWrite = { bg = p.highlight_med },

		-- lsp border
      LspInfoBorder = { link = "FloatBorder" },

		-- lsp-highlight-codelens
		LspCodeLens = { fg = p.subtle }, -- virtual text of code lens
		LspCodeLensSeparator = { fg = p.highlight_high }, -- separator between two or more code lens

		-- romgrk/barbar.nvim
		BufferCurrent = { fg = p.text, bg = p.overlay },
		BufferCurrentIndex = { fg = p.text, bg = p.overlay },
		BufferCurrentMod = { fg = p.foam, bg = p.overlay },
		BufferCurrentSign = { fg = p.subtle, bg = p.overlay },
		BufferCurrentTarget = { fg = p.gold, bg = p.overlay },
		BufferInactive = { fg = p.subtle },
		BufferInactiveIndex = { fg = p.subtle },
		BufferInactiveMod = { fg = p.foam },
		BufferInactiveSign = { fg = p.muted },
		BufferInactiveTarget = { fg = p.gold },
		BufferTabpageFill = { fg = groups.background, bg = groups.background },
		BufferVisible = { fg = p.subtle },
		BufferVisibleIndex = { fg = p.subtle },
		BufferVisibleMod = { fg = p.foam },
		BufferVisibleSign = { fg = p.muted },
		BufferVisibleTarget = { fg = p.gold },

		-- lewis6991/gitsigns.nvim
		GitSignsAdd = { fg = groups.git_add },
		GitSignsChange = { fg = groups.git_change },
		GitSignsDelete = { fg = groups.git_delete },
		GitSignsStagedAdd = { fg = groups.git_stage },
		GitSignsStagedChange = { fg = groups.git_stage },
		GitSignsStagedDelete = { fg = groups.git_stage },
		GitSignsAddInline    = { link = "DiffAdd"                  },
		GitSignsDeleteInline = { link = "DiffDelete"               },
		GitSignsChangeInline = { bg   = blend("rose", "base", 0.2) },
		SignAdd = { link = 'GitSignsAdd' },
		SignChange = { link = 'GitSignsChange' },
		SignDelete = { link = 'GitSignsDelete' },

		-- mvllow/modes.nvim
		ModesCopy = { bg = p.gold },
		ModesDelete = { bg = p.love },
		ModesInsert = { bg = p.foam },
		ModesVisual = { bg = p.iris },

		-- kyazdani42/nvim-tree.lua
		NvimTreeEmptyFolderName = { fg = p.muted },
		NvimTreeFileDeleted = { fg = p.love },
		NvimTreeFileDirty = { fg = p.rose },
		NvimTreeFileMerge = { fg = p.iris },
		NvimTreeFileNew = { fg = p.foam },
		NvimTreeFileRenamed = { fg = p.pine },
		NvimTreeFileStaged = { fg = p.iris },
		NvimTreeFolderIcon = { fg = p.subtle },
		NvimTreeFolderName = { fg = p.foam },
		NvimTreeGitDeleted = { fg = groups.git_delete },
		NvimTreeGitDirty = { fg = groups.git_dirty },
		NvimTreeGitIgnored = { fg = groups.git_ignore },
		NvimTreeGitMerge = { fg = groups.git_merge },
		NvimTreeGitNew = { fg = groups.git_add },
		NvimTreeGitRenamed = { fg = groups.git_rename },
		NvimTreeGitStaged = { fg = groups.git_stage },
		NvimTreeImageFile = { fg = p.text },
		NvimTreeNormal = { fg = p.text },
		NvimTreeOpenedFile = { fg = p.text, bg = p.highlight_med },
		NvimTreeOpenedFolderName = { link = 'NvimTreeFolderName' },
		NvimTreeRootFolder = { fg = p.iris },
		NvimTreeSpecialFile = { link = 'NvimTreeNormal' },
		NvimTreeWindowPicker = { fg = groups.background, bg = p.iris },

		-- folke/which-key.nvim
		WhichKey = { fg = p.iris },
		WhichKeyGroup = { fg = p.foam },
		WhichKeySeparator = { fg = p.subtle },
		WhichKeyDesc = { fg = p.gold },
		WhichKeyFloat = { bg = groups.panel },
		WhichKeyValue = { fg = p.rose },

		-- luka-reineke/indent-blankline.nvim
		IndentBlanklineChar = { fg = p.muted },
		IndentBlanklineSpaceChar = {
			fg = blend(p.muted, groups.background, 0.5),
		}, -- visible indentation (also includes tabs)
		IndentBlanklineSpaceCharBlankline = { fg = p.muted },
		IndentBlanklineContextChar = { fg = p.foam },
		IndentBlanklineContextStart = { style = 'underline', sp = p.foam },
		IndentBlanklineIndentVisible = { fg = p.love, style = 'nocombine' },

		-- echasnovski/mini.indentscope
		MiniIndentscopeSymbol = { fg = p.foam },

		-- hrsh7th/nvim-cmp
		CmpItemAbbr = { fg = p.subtle },
		CmpItemAbbrDeprecated = { fg = p.subtle, style = 'strikethrough' },
		CmpItemAbbrMatch = { fg = p.text, style = 'bold' },
		CmpItemAbbrMatchFuzzy = { fg = p.text, style = 'bold' },
		CmpItemKind = { fg = p.iris },
		CmpItemKindClass = { fg = p.gold },
		CmpItemKindFunction = { fg = p.iris },
		CmpItemKindInterface = { fg = p.gold },
		CmpItemKindMethod = { fg = p.iris },
		CmpItemKindSnippet = { fg = p.gold },
		CmpItemKindVariable = { fg = p.foam },
		CmpItemKindBoolean  = { link = "Boolean"         },
		CmpItemKindProperty = { fg="text"},
		CmpItemKindString   = { fg = p.rose            },
		CmpItemKindText     = { fg   = p.pine            },
		CmpPmenusel = { bg = (vim.opt.background:get()=='light') and "highlight_low" or "highlight_high"  },
		GhostText = { fg = p.muted },

		-- SmiteshP/nvim-navic
		NavicIconsNamespace     = { link = "@namespace"       },
		NavicIconsPackage       = { fg   = p.iris             },
		NavicIconsClass         = { link = "CmpItemKindClass" },
		NavicIconsMethod        = { link = "Method"           },
		NavicIconsProperty      = { link = "TSProperty"       },
		NavicIconsField         = { link = "TsField"          },
		NavicIconsConstructor   = { link = "TsConstructor"    },
		NavicIconsEnum          = { link = "LspType"          },
		NavicIconsInterface     = { link = "LspInterface"     },
		NavicIconsFunction      = { link = "Function"         },
		NavicIconsVariable      = { fg   = p.foam             },
		NavicIconsConstant      = { link = "Constant"         },
		NavicIconsString        = { link = "String"           },
		NavicIconsNumber        = { link = "Number"           },
		NavicIconsBoolean       = { link = "Boolean"          },
		NavicIconsArray         = { fg   = p.subtle             },
		NavicIconsObject        = { fg   = p.subtle             },
		NavicIconsKey           = { fg   = p.gold             },
		NavicIconsEvent         = { link = "TsProperty"       },
		NavicIconsOperator      = { link = "Operator"         },
		NavicIconsTypeParameter = { fg   = p.iris             },
		NavicText               = { link = "Normal"           },
		NavicSeparator          = { fg   = p.muted            },
		-- NavicIconsFile
		NavicIconsModule        = { fg = p.rose},
		-- NavicIconsNull
		-- NavicIconsEnumMember
		-- NavicIconsStruct

		-- TimUntersberger/neogit
		NeogitDiffAddHighlight = { fg = p.foam, bg = p.highlight_med },
		NeogitDiffContextHighlight = { bg = p.highlight_low },
		NeogitDiffDeleteHighlight = { fg = p.love, bg = p.highlight_med },
		NeogitHunkHeader = { bg = p.highlight_low },
		NeogitHunkHeaderHighlight = { bg = p.highlight_low },

		-- vimwiki/vimwiki
		VimwikiHR = { fg = p.subtle },
		VimwikiHeader1 = { fg = groups.headings.h1, style = 'bold' },
		VimwikiHeader2 = { fg = groups.headings.h2, style = 'bold' },
		VimwikiHeader3 = { fg = groups.headings.h3, style = 'bold' },
		VimwikiHeader4 = { fg = groups.headings.h4, style = 'bold' },
		VimwikiHeader5 = { fg = groups.headings.h5, style = 'bold' },
		VimwikiHeader6 = { fg = groups.headings.h6, style = 'bold' },
		VimwikiHeaderChar = { fg = p.pine },
		VimwikiLink = { fg = groups.link, style = 'underline' },
		VimwikiList = { fg = p.iris },
		VimwikiNoExistsLink = { fg = p.love },

		-- nvim-neorg/neorg
		NeorgHeading1Prefix = { fg = groups.headings.h1, style = 'bold' },
		NeorgHeading1Title = { link = 'NeorgHeading1Prefix' },
		NeorgHeading2Prefix = { fg = groups.headings.h2, style = 'bold' },
		NeorgHeading2Title = { link = 'NeorgHeading2Prefix' },
		NeorgHeading3Prefix = { fg = groups.headings.h3, style = 'bold' },
		NeorgHeading3Title = { link = 'NeorgHeading3Prefix' },
		NeorgHeading4Prefix = { fg = groups.headings.h4, style = 'bold' },
		NeorgHeading4Title = { link = 'NeorgHeading4Prefix' },
		NeorgHeading5Prefix = { fg = groups.headings.h5, style = 'bold' },
		NeorgHeading5Title = { link = 'NeorgHeading5Prefix' },
		NeorgHeading6Prefix = { fg = groups.headings.h6, style = 'bold' },
		NeorgHeading6Title = { link = 'NeorgHeading6Prefix' },
		NeorgMarkerTitle = { fg = p.text, style = 'bold' },

		-- tami5/lspsaga.nvim (fork of glepnir/lspsaga.nvim)
		DefinitionCount = { fg = p.rose },
		DefinitionIcon = { fg = p.rose },
		DefintionPreviewTitle = { fg = p.rose, style = 'bold' },
		LspFloatWinBorder = { fg = groups.border },
		LspFloatWinNormal = { bg = groups.background },
		LspSagaAutoPreview = { fg = p.subtle },
		LspSagaCodeActionBorder = { fg = groups.border },
		LspSagaCodeActionContent = { fg = p.foam },
		LspSagaCodeActionTitle = { fg = p.gold, style = 'bold' },
		LspSagaCodeActionTruncateLine = { link = 'LspSagaCodeActionBorder' },
		LspSagaDefPreviewBorder = { fg = groups.border },
		LspSagaDiagnosticBorder = { fg = groups.border },
		LspSagaDiagnosticHeader = { fg = p.gold, style = 'bold' },
		LspSagaDiagnosticTruncateLine = { link = 'LspSagaDiagnosticBorder' },
		LspSagaDocTruncateLine = { link = 'LspSagaHoverBorder' },
		LspSagaFinderSelection = { fg = p.gold },
		LspSagaHoverBorder = { fg = groups.border },
		LspSagaLspFinderBorder = { fg = groups.border },
		LspSagaRenameBorder = { fg = p.pine },
		LspSagaRenamePromptPrefix = { fg = p.love },
		LspSagaShTruncateLine = { link = 'LspSagaSignatureHelpBorder' },
		LspSagaSignatureHelpBorder = { fg = p.pine },
		ReferencesCount = { fg = p.rose },
		ReferencesIcon = { fg = p.rose },
		SagaShadow = { bg = p.overlay },
		TargetWord = { fg = p.iris },
		SagaWinbarFilename = { fg = p.text, style = 'bold' },
		SagaWinbarFolderName = { fg = p.foam },
		SagaWinbarFolderIcon = { fg = p.foam },
		SagaWinbarSep = { fg = p.love },
		SagaWinbarWord = { fg = p.text },
		SagaWinbarFunction = { fg = p.iris },

		-- ray-x/lsp_signature.nvim
		LspSignatureActiveParameter = { bg = p.overlay },

		-- rlane/pounce.nvim
		PounceAccept = { fg = p.love, bg = p.highlight_high },
		PounceAcceptBest = { fg = p.base, bg = p.gold },
		PounceGap = { link = 'Search' },
		PounceMatch = { link = 'Search' },

		-- nvim-telescope/telescope.nvim
		TelescopeBorder = { fg = groups.border },
		TelescopeMatching = { fg = p.rose },
		TelescopeNormal = { fg = p.subtle },
		TelescopePromptNormal = { fg = p.text },
		TelescopePromptPrefix = { fg = p.subtle },
		TelescopeSelection = { fg = p.text, bg = p.overlay },
		TelescopeSelectionCaret = { fg = p.rose, bg = p.overlay },
		TelescopeTitle = { fg = p.subtle },

		-- rcarriga/nvim-notify
		NotifyINFOBorder = { fg = p.foam },
		NotifyINFOTitle = { link = 'NotifyINFOBorder' },
		NotifyINFOIcon = { link = 'NotifyINFOBorder' },
		NotifyWARNBorder = { fg = p.gold },
		NotifyWARNTitle = { link = 'NotifyWARNBorder' },
		NotifyWARNIcon = { link = 'NotifyWARNBorder' },
		NotifyDEBUGBorder = { fg = p.muted },
		NotifyDEBUGTitle = { link = 'NotifyDEBUGBorder' },
		NotifyDEBUGIcon = { link = 'NotifyDEBUGBorder' },
		NotifyTRACEBorder = { fg = p.iris },
		NotifyTRACETitle = { link = 'NotifyTRACEBorder' },
		NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },
		NotifyERRORBorder = { fg = p.love },
		NotifyERRORTitle = { link = 'NotifyERRORBorder' },
		NotifyERRORIcon = { link = 'NotifyERRORBorder' },

		-- rcarriga/nvim-dap-ui
		DapUIVariable = { link = 'Normal' },
		DapUIValue = { link = 'Normal' },
		DapUIFrameName = { link = 'Normal' },
		DapUIThread = { fg = p.gold },
		DapUIWatchesValue = { link = 'DapUIThread' },
		DapUIBreakpointsInfo = { link = 'DapUIThread' },
		DapUIBreakpointsCurrentLine = { fg = p.gold, style = 'bold' },
		DapUIWatchesEmpty = { fg = p.love },
		DapUIWatchesError = { link = 'DapUIWatchesEmpty' },
		DapUIBreakpointsDisabledLine = { fg = p.muted },
		DapUISource = { fg = p.iris },
		DapUIBreakpointsPath = { fg = p.foam },
		DapUIScope = { link = 'DapUIBreakpointsPath' },
		DapUILineNumber = { link = 'DapUIBreakpointsPath' },
		DapUIBreakpointsLine = { link = 'DapUIBreakpointsPath' },
		DapUIFloatBorder = { link = 'DapUIBreakpointsPath' },
		DapUIStoppedThread = { link = 'DapUIBreakpointsPath' },
		DapUIDecoration = { link = 'DapUIBreakpointsPath' },
		DapUIModifiedValue = { fg = p.foam, style = 'bold' },

		-- glepnir/dashboard-nvim
		DashboardShortcut = { fg = p.love },
		DashboardHeader = { fg = p.pine },
		DashboardCenter = { fg = p.gold },
		DashboardFooter = { fg = p.iris },

		-- akinsho/toggleterm.nvim
		ToggleTermNormalFloat = { bg = p.base },

		-- akinsho/nvim-bufferline.lua
		BufferLineOffsetHeading = { bg = "overlay", style = "bold" },

		-- winbar
		WinBar     = { link       = "NavicText" },
		WinBarNC   = { bg=p.mute, fg=p.mute},
		WinBarFile = { fg=p.text },
		WinbarPath = { fg = p.foam},
		WinBarSeparator    = { fg   = p.muted     },
		WinBarDirSeparator = { fg   = p.muted     },
		WinBarDirIcon      = { link = "Directory" },

		-- petertriho/nvim-scrollbar
		ScrollbarHandle = { bg="muted", fg="muted"},

		-- goolord/alpha-nvim
		AlphaHeader = { fg = "pine", style="bold"},
		AlphaFooter = { fg = "muted"},
		AlphaButton = { fg = "foam", style="bold"},

		-- p00f/nvim-ts-rainbow
		rainbowcol1 = { link = "SpecialKey" },

		--- lukas-reineke/indent-blankline.nvim
		IndentBlanklineContextChar  = { fg  = p.foam              },
		IndentBlanklineContextStart = { style = "underline", sp = p.foam},

		--- RRethy/vim-illuminate
		MatchWord = { bg = (vim.opt.background:get()=='light') and "highlight_low" or "highlight_med" },
		IlluminatedWordRead  = { link = "MatchWord" },
      IlluminatedWordText  = { link = "MatchWord" },
      IlluminatedWordWrite = { link = "MatchWord" },

		--- kevinhwang91/nvim-hlslens
		-- active word
		HlSearchNear = { fg=p.rose, bg = "none", style="underline,bold"},
		-- label of active word
		HlSearchLensNear = { fg=p.rose, bg=p.surface, style="bold"},
		-- nearest text for the floating window
		-- HlSearchFloat = { fg="foam", bg="love",},
		-- color of label of other n and N's
		HlSearchLens = { fg=p.rose, bg=p.surface,},

		-- kevinhwang91/nvim-ufo
		UfoFoldedBg             = { link = 'Visual' },
		UfoFoldedEllipsisCustom = { fg   = p.text,  bg = p.highlight_med },

		-- m-demare/hlargs.nvim
		Hlarg9 = { fg = p.love },
		Hlarg12 = { fg = p.pine },
		Hlarg5 = { fg = 'iris' },

		-- kylechui/nvim-surround
		NvimSurroundHighlight = {
			fg = p.love,
			bg = p.highlight_med,
			style = 'italic',
		},

		-- kosayoda/nvim-lightbulb
		LightBulbVirtualText = { fg = 'muted' },
	}

	vim.g.terminal_color_0 = p.overlay -- black
	vim.g.terminal_color_8 = p.subtle -- bright black
	vim.g.terminal_color_1 = p.love -- red
	vim.g.terminal_color_9 = p.love -- bright red
	vim.g.terminal_color_2 = p.pine -- green
	vim.g.terminal_color_10 = p.pine -- bright green
	vim.g.terminal_color_3 = p.gold -- yellow
	vim.g.terminal_color_11 = p.gold -- bright yellow
	vim.g.terminal_color_4 = p.foam -- blue
	vim.g.terminal_color_12 = p.foam -- bright blue
	vim.g.terminal_color_5 = p.iris -- magenta
	vim.g.terminal_color_13 = p.iris -- bright magenta
	vim.g.terminal_color_6 = p.rose -- cyan
	vim.g.terminal_color_14 = p.rose -- bright cyan
	vim.g.terminal_color_7 = p.text -- white
	vim.g.terminal_color_15 = p.text -- bright white

	return theme
end

return M
