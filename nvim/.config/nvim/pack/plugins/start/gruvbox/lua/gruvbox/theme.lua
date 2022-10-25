-- vim:ts=4 cc=36,38,53,68,83,98

local M = {}

local c = require('gruvbox.colors').palette()

M.helper = function()
	return {
		default                        = { fg=c.c1.h    , bg=c.c0.l    , },
		ui                             = { fg=c.c2.h    , bg=c.c1.l    , },
		ui1                            = { fg=c.c2.h    , bg=c.c2.l    , },
		ui2                            = { fg=c.c0.l    , bg=c.c3.l    , },

		error                          = { fg=c.red.n   ,                },
		warn                           = { fg=c.purple.n,                },
		info                           = { fg=c.blue.n  ,                },
		debug                          = { fg=c.green.n ,                },
		trace                          = { fg=c.aqua.l  ,                },
	}
end


M.get = function()
	local h = M.helper()
	local theme = {}

	theme.editor = {
		-- Common

		-- NC = not-current window
		Normal                     = { fg=c.c1.h    , bg=c.c0.l                                  },
		--NormalNC                   = { fg=c.f1      , bg=c.b0                                    },
		--NormalFloat                = { fg=c.f1      , bg=c.b0                                    },
		Conceal                    = { fg=c.blue.n                                               },
		Title                      = { fg=c.orange.n                                             },
		FloatBorder                = {                                                           },
		FloatShadow                = {                                                           },
		FloatShadowThrough         = {                                                           },

		MatchParen                 = { fg=c.c3.l    ,                               bold=true    },

		Cursor                     = {                                              reverse=true },
		CursorColumn               = {                bg=c.c01.l                                },
		CursorLine                 = {                bg=c.c01.l                                  },
		CursorLineNr               = { fg=c.purple.h, bg=c.c01.l   ,                bold=true    },
		ColorColumn                = {                bg=h.ui1.bg  ,                             },
		--lCursor                    = { fg=c.b0      , bg=c.b0                                    },
		--CursorIM                   = { fg=c.b0      , bg=c.b0                                    },

		LineNr                     = { fg=c.c1.h    , bg=c.c0.l    ,                bold=true    },
		LineNrAbove                = { fg=c.c4.l                                                 },
		LineNrBelow                = { link='LineNrAbove'                                        },

		DiffAdd                    = { fg=c.green.n ,                                            },
		DiffChange                 = { fg=c.yellow.n,                                            },
		DiffDelete                 = { fg=c.red.n   ,                                            },
		DiffText                   = { fg=c.blue.n  ,                                            },

		Directory                  = { fg=c.blue.n  ,                               underline=true },


		FoldColumn                 = { fg=c.gray.n  , bg=c.c1.l                                  },
		Folded                     = { fg=c.blue.l  ,                               italic=true  },

		--MsgArea                    = {                                                           },
		--MsgSeparator               = {                                                           },
		ErrorMsg                   = { fg=h.error.fg                                             },
		ModeMsg                    = { fg=c.yellow.n,                                            },
		MoreMsg                    = { fg=c.yellow.n,                                            },
		WarningMsg                 = { fg=h.warn.fg ,                                            },

		EndOfBuffer                = { fg=c.c1.l                                                 },
		NonText                    = { fg=c.c2.l                                                 },
		--Whitespace                 = {                                                           },

		Pmenu                      = { fg=c.c1.h    , bg=c.c0.l                                  },
		PmenuSbar                  = {                bg=c.c2.l                                  },
		PmenuSel                   = { fg=c.c2.l    , bg=c.blue.n                                },
		PmenuThumb                 = {                bg=c.c4.l                                  },

		Question                   = { fg=c.orange.n,                               bold=true    },
		--QuickFixLine               = {                                                           },
		SignColumn                 = {                bg=c.c0.l                                  },

		Search                     = {                bg=c.yellow.l,                             },
		IncSearch                  = {                bg=c.yellow.n,                             },
		CurSearch                  = { fg=c.c0.h    , bg=c.yellow.n,                underdotted=true },

		SpecialKey                 = { fg=c.c4.h    ,                                            },
		SpellBad                   = {                               sp=c.orange.n, undercurl=true },
		SpellCap                   = {                               sp=c.purple.n, undercurl=true },
		SpellLocal                 = {                               sp=c.yellow.n, undercurl=true },
		SpellRare                  = {                               sp=c.blue.l  , undercurl=true },
		--StatusLine                 = { fg=c.b1      , bg=c.b1                                    },
		--StatusLineNC               = { fg=c.b1      , bg=c.b00                                   },

		TabLine                    = { fg=c.c2.h    , bg=c.c1.l                                  },
		TabLineFill                = { link='TabLine'                                            },
		TabLineSel                 = { fg=c.green.n , bg=c.c1.h                                  },

		TermCursor                 = { fg=c.c3.l    , bg=c.c0.h                                  }, -- TODO:
		TermCursorNC               = {                                                           }, -- TODO:
		VertSplit                  = { fg=c.c3.l    , bg=c.c0.l                                  },
		Visual                     = {                bg=c.c3.l                                  },
		--VisualNC                   = { fg=c.b0      , bg=c.b01                                   },
		VisualNOS                  = { link='Visual'                                             },

		WildMenu                   = { fg=c.blue.n  , bg=c.c2.l    ,                bold=true    },
		--Substitute                 = {                                                           },



		--RedrawDebugNormal          = {                                                           },
		--RedrawDebugClear           = {                                                           },
		--RedrawDebugComposed        = {                                                           },
		--RedrawDebugRecompose       = {                                                           },


		-- Syntax
		Constant                   = { fg=c.purple.n,                                            },
		Boolean                    = { fg=c.purple.n,                                            },
		Character                  = { fg=c.aqua.h  ,                                            },
		Float                      = { fg=c.purple.n,                                            },
		Number                     = { fg=c.purple.n,                                            },
		String                     = { fg=c.aqua.n  , bg=c.c1.l                                  },

		Identifier                 = { fg=c.blue.n  ,                                            },
		Function                   = { fg=c.blue.n  ,                               bold=true    },

		Statement                  = { fg=c.green.n ,                                            },
		Conditional                = { fg=c.green.n ,                               bold=true    },
		Repeat                     = { fg=c.green.n ,                               bold=true    },
		Label                      = { fg=c.red.n   ,                               underline=true,bold=true },
		Operator                   = { fg=c.green.n ,                                            },
		Keyword                    = { fg=c.green.n ,                                            },
		Exception                  = { fg=c.green.n ,                                            },

		PreProc                    = { fg=c.orange.n,                                            },
		Include                    = { fg=c.orange.n,                                            },
		Define                     = { fg=c.orange.n,                                            },
		Macro                      = { fg=c.orange.n,                                            },
		PreCondit                  = { fg=c.orange.n,                                            },

		Type                       = { fg=c.yellow.n,                                            },
		StorageClass               = { fg=c.yellow.n,                                            },
		Structure                  = { fg=c.yellow.n,                                            },
		Typedef                    = { fg=c.yellow.n,                                            },

		Special                    = { fg=c.red.n   ,                                            },
		SpecialChar                = { fg=c.red.n   ,                                            },
		Tag                        = { fg=c.blue.n  ,                                            },
		Delimiter                  = { fg=c.red.n   ,                                            },
		Debug                      = { fg=c.red.n   ,                                            },

		Comment                    = { fg=c.gray.n  ,                                            },
		SpecialComment             = { fg=c.red.n   ,                                            },
		Error                      = { fg=c.red.n   ,                                            },
		Todo                       = { fg=c.purple.n,                               bold=true    },
		Underlined                 = {                                              underline=true },

		ConId                      = { link='Type'                                               },
		VarId                      = { link='Identifier'                                         },


		-- Diff

		diffAdded                  = { fg=c.green.n ,                                            },
		diffBDiffer                = { fg=c.red.n   ,                                            },
		diffCommon                 = { fg=c.red.n   ,                                            },
		diffDiffer                 = { fg=c.red.n   ,                                            },
		diffIdentical              = { fg=c.red.n   ,                                            },
		diffIsA                    = { fg=c.red.n   ,                                            },
		diffLine                   = { fg=c.blue.n  ,                                            },
		diffNoEOL                  = { fg=c.red.n   ,                                            },
		diffOnly                   = { fg=c.red.n   ,                                            },
		diffRemoved                = { fg=c.red.n   ,                                            },
		--DiffDelete
		--DiffChange
		--DiffText
		--DiffAdd
	}

	theme.plugin = {

		-- Treesitter (nvim-treesitter-highlights)
		--     https://github.com/nvim-treesitter/nvim-treesitter
		['@field']                 = { fg=c.blue.n                                               },
		['@property']              = { fg=c.blue.n  ,                               underline=true },
		['@include']               = { link='Include'                                            },
		['@operator']              = { link='Operator'                                           },
		--['@keyword.operator']      = {                                                           },

		['@constructor']           = { fg=c.blue.n  ,                               bold=true    },
		['@constant']              = { link='Constant'                                           },
		['@conditional']           = { link='Conditional'                                        },
		['@repeat']                = { link='Repeat'                                             },
		['@exception']             = { link='Exception'                                          },

		['@constant.builtin']      = {                                              bold=true, italic=true},
		['@function.builtin']      = { link='@function'                                          },

		--['@namespace']             = { fg=c.f1                                                   },
		--['@type']                  = {                                                           },
		--['@type.builtin']          = {                                                           },
		--['@variable.builtin']      = { fg=c.blue.n                                               },

		['@function']              = { link='Function'                                           },
		['@function.macro']        = { link='Function'                                           },
		--['@parameter']             = { fg=c.f1                                                   },
		['@keyword']               = { link='Keyword'                                            },
		--['@keyword.function']      = {                                                           },
		['@keyword.return']        = { fg=c.purple.h,                             bold=true, italic=true},



		['@attribute']             = { fg=c.gray.n  ,                                            },
		['@character']             = { link='Character'                                          },
		['@character.special']     = { fg=c.purple.n,                                            },
		['@comment']               = { link='Comment'                                            },
		['@constant.macro']        = { link='Define'                                             },
		['@debug']                 = { link='Debug'                                              },
		['@define']                = { link='Define'                                             },
		-- While typing @error may colorize large sections of code.
		['@error']                 = {                                                           },
		['@label']                 = { link='Label'                                              },
		['@method']                = { fg=c.f1                                                   },

		['@boolean']               = { link='Boolean'                                            },
		['@float']                 = { link='Float'                                             },
		['@number']                = { link='Number'                                             },

		--['@parameter.reference']   = { fg=c.f1                                                   },


		['@punctuation.bracket']   = { fg=c.blue.h                                               },
		['@punctuation.delimiter'] = { fg=c.c0.h                                                 },
		--['@punctuation.special']   = { fg=c.gray.n                                               },

		--['@storageclass']          = {                                                           },

		['@string']                = { link='String'                                             },
		['@string.regex']          = { fg=c.orange.n,                                            },
		['@string.escape']         = { fg=c.red.n   ,                                            },
		['@string.special']        = { fg=c.purple.n,                                            },

		['@symbol']                = { link='Identifier'                                         },

		['@tag']                   = { link='Tag'                                                },
		['@tag.attribute']         = { fg=c.aqua.n                                               },
		['@tag.delimiter']         = { fg=c.blue.l                                               },

		['@text']                  = { link='Normal'                                             },
		['@text.strong']           = {                                              bold=true    },
		['@text.emphasis']         = {                                              bold=true, underline=true },
		['@text.underline']        = { link='Underlined'                                           },
		['@text.strike']           = {                                              strikethrough=true },
		['@text.title']            = { fg=c.orange.n, bg=c.c1.l,                    bold=true    },
		['@text.literal']          = {                bg=c.c1.l,                                 },
		['@text.uri']              = { link='Directory'                                          },
		--['@text.math']             = {                                                           },
		['@text.reference']        = { fg=c.c3.l    ,                                            },
		--['@text.environment']      = {                                              bold=true    },
		--['@text.environment.name'] = {                                              bold=true    },

		['@text.note']             = { fg=c.orange.n,                               bold=true    },
		['@text.warning']          = { fg=h.warn.fg ,                               bold=true    },
		['@text.danger']           = { fg=h.error.fg,                               bold=true    },

		--['@type.qualifier']        = {}
		--['@type.definition']

		--['@variable']              = { fg=c.blue.n                                               },

		-- Json
		['@label.json']            = { fg=c.blue.h  ,                                            },

		-- TOML
		['@property.toml']         = { fg=c.blue.h  ,                                            },


		-- https://github.com/nvim-treesitter/nvim-treesitter-refactor
		-- TSDefinition
		-- TSDefinitionUsage
		-- TSCurrentScope


		-- Native LSP
		-- Diagnostic (diagnostic-highlights)
		DiagnosticError            = { fg=h.error.fg,                                            },
		DiagnosticVirtualError     = { fg=h.error.fg,                                            },
		DiagnosticUnderlineError   = { fg=h.error.fg,                               underline=true },
		DiagnosticFloatingError    = { fg=h.error.fg,                                            },
		DiagnosticSignError        = { fg=h.error.fg,                                            },

		DiagnosticWarn             = { fg=h.warn.fg ,                                            },
		DiagnosticVirtualWarn      = { fg=h.warn.fg ,                                            },
		DiagnosticUnderlineWarn    = { fg=h.warn.fg ,                               underline=true },
		DiagnosticFloatingWarn     = { fg=h.warn.fg ,                                            },
		DiagnosticSignWarn         = { fg=h.warn.fg ,                                            },

		DiagnosticInfo             = { fg=h.info.fg ,                                            },
		DiagnosticVirtualInfo      = { fg=h.info.fg ,                                            },
		DiagnosticUnderlineInfo    = { fg=h.info.fg ,                               underline=true },
		DiagnosticFloatingInfo     = { fg=h.info.fg ,                                            },
		DiagnosticSignInfo         = { fg=h.info.fg ,                                            },

		DiagnosticHint             = { fg=h.debug.fg,                                            },
		DiagnosticVirtualHint      = { fg=h.debug.fg,                                            },
		DiagnosticUnderlineHint    = { fg=h.debug.fg,                               underline=true },
		DiagnosticFloatingHint     = { fg=h.debug.fg,                                            },
		DiagnosticSignHint         = { fg=h.debug.fg,                                            },

		LspReferenceText           = {                bg=c.blue.h                                },
		LspReferenceRead           = {                bg=c.blue.l                                },
		LspReferenceWrite          = {                bg=c.red.h                                 },

		-- https://github.com/neovim/nvim-lspconfig
		LspInfoBorder              = { link='FloatBorder'                                        },

		-- https://github.com/hrsh7th/nvim-cmp
		--CmpItemAbbr                = { fg = c.overlay2                                           },
		--CmpItemAbbrDeprecated      = { fg = c.overlay0, strikethrough=true },
		--CmpItemKind                = { fg = c.blue },
		--CmpItemMenu                = { fg = c.text },
		--CmpItemAbbrMatch           = { fg = c.text, bold=true },
		--CmpItemAbbrMatchFuzzy      = { fg = c.text, bold=true },

		-- kind support
		--CmpItemKindSnippet         = { fg = c.mauve },
		CmpItemKindKeyword         = { link='@keyword' },
		CmpItemKindText            = { link='@text' },
		CmpItemKindMethod          = { link='@method' },
		CmpItemKindConstructor     = { link='@constructor' },
		CmpItemKindFunction        = { link='@function' },
		CmpItemKindFolder          = { link='Directory' },
		--CmpItemKindModule          = { fg = c.blue },
		CmpItemKindConstant        = { link='@constant' },
		CmpItemKindField           = { link='@field'},
		CmpItemKindProperty        = { link='@property' },
		CmpItemKindEnum            = { link='@constant' },
		--CmpItemKindUnit            = { fg = c.green },
		CmpItemKindClass           = { link='@type'  },
		CmpItemKindVariable        = { link='@variable' },
		CmpItemKindFile            = { link='Directory' },
		CmpItemKindInterface       = { link='@namespace' },
		--CmpItemKindColor           = { fg = c.red },
		CmpItemKindReference       = { link='@text.reference' },
		CmpItemKindEnumMember      = { link='@constant' },
		CmpItemKindStruct          = { link='@type' },
		--CmpItemKindValue           = { fg = c.peach },
		--CmpItemKindEvent           = { link='@'    },
		CmpItemKindOperator        = { link='@operator' },
		CmpItemKindTypeParameter   = { link='@parameter' },
		CmpItemKindCopilot         = { link='CmpItemKindSnippet' },


		-- NvimTree
		-- Telescope
		-- Git
		gitcommitDiscardedFile     = { fg=c.red.n                                                },
		gitcommitSelectedFile      = { fg=c.green.n                                              },

		-- https://github.com/lewis6991/gitsigns.nvim
		GitSignsAdd                = { fg=c.green.o                ,                             },
		GitSignsChange             = { fg=c.yellow.o               ,                             },
		GitSignsDelete             = { fg=c.red.n                  ,                             },
		GitSignsAddNr              = { link='GitSignsAdd'                                        },
		GitSignsChangeNr           = { link='GitSignsChange'                                     },
		GitSignsDeleteNr           = { link='GitSignsDelete'                                     },
		GitSignsAddLn              = {                bg=c.green.l ,                             },
		GitSignsChangeLn           = {                bg=c.aqua.l  ,                             },
		GitSignsDeleteLn           = {                bg=c.red.l   ,                             },
		GitSignsCurrentLineBlame   = { fg=c.c3.l                                                 },

		-- https://github.com/lukas-reineke/indent-blankline.nvim
		IndentBlanklineIndent1     = { link = 'rainbowcol1'                                      },
		IndentBlanklineIndent2     = { link = 'rainbowcol2'                                      },
		IndentBlanklineIndent3     = { link = 'rainbowcol3'                                      },
		IndentBlanklineIndent4     = { link = 'rainbowcol4'                                      },
		IndentBlanklineIndent5     = { link = 'rainbowcol5'                                      },
		IndentBlanklineIndent6     = { link = 'rainbowcol6'                                      },
		IndentBlanklineIndent7     = { link = 'rainbowcol7'                                      },
		--IndentBlanklineContextChar = {                                                           },
		--IndentBlanklineSpaceChar   = {                                                           },

		-- https://github.com/p00f/nvim-ts-rainbow
		rainbowcol1                = { fg=c.purple.n,                                            },
		rainbowcol2                = { fg=c.blue.h  ,                                            },
		rainbowcol3                = { fg=c.aqua.n  ,                                            },
		rainbowcol4                = { fg=c.green.n ,                                            },
		rainbowcol5                = { fg=c.yellow.n,                                            },
		rainbowcol6                = { fg=c.orange.n,                                            },
		rainbowcol7                = { fg=c.red.h   ,                                            },

		-- https://github.com/ggandor/leap.nvim
		LeapMatch                  = { fg=c.c1.h    ,                               nocombine=true, underline=true},
		LeapLabelPrimary           = { fg=c.c0.l    , bg=c.aqua.l  ,                nocombine=true, bold=true },
		LeapLabelSecondary         = { fg=c.c0.l    , bg=c.aqua.l  ,                nocombine=true, bold=true },
		--LeapBackdrop               = {                                                           },

		-- https://github.com/folke/which-key.nvim
		-- WhichKey
		-- WhichKeyGroup
		-- WhichKeySeparator
		-- WhichKeyDesc
		-- WhichKeyFloat
		-- WhichKeyValue

		-- https://github.com/j-hui/fidget.nvim
		FidgetTitle                = { link='Title'                                              },
		FidgetTask                 = { link='Normal'                                             },

		-- https://github.com/rcarriga/nvim-notify
		NotifyERRORBorder          = { fg=h.error.fg,                                            },
		NotifyERRORIcon            = { fg=h.error.fg,                                            },
		NotifyERRORTitle           = { fg=h.error.fg,                               bold=true    },

		NotifyWARNBorder           = { fg=h.warn.fg ,                                            },
		NotifyWARNIcon             = { fg=h.warn.fg ,                                            },
		NotifyWARNTitle            = { fg=h.warn.fg ,                               bold=true    },

		NotifyINFOBorder           = { fg=h.info.fg ,                                            },
		NotifyINFOIcon             = { fg=h.info.fg ,                                            },
		NotifyINFOTitle            = { fg=h.info.fg ,                               bold=true    },

		NotifyDEBUGBorder          = { fg=h.debug.fg,                                            },
		NotifyDEBUGIcon            = { fg=h.debug.fg,                                            },
		NotifyDEBUGTitle           = { fg=h.debug.fg,                               bold=true    },

		NotifyTRACEBorder          = { fg=h.trace.fg,                                            },
		NotifyTRACEIcon            = { fg=h.trace.fg,                                            },
		NotifyTRACETitle           = { fg=h.trace.fg,                               bold=true    },

		-- https://github.com/akinsho/bufferline.nvim
		--BufferlineFill = { bg=h.ui.bg },
		----BufferlineBackground = { },
		--
		--BufferlineBufferVisible  = { fg=h.ui1.fg    , bg=h.ui1.bg},
		--BufferlineBufferSelected = { fg=c.c0.h      , bg=h.ui2.bg},
		--
		----BufferlineTab = { },
		----BufferlineTabSelected = { },
		----BufferlineTabClose = { },
		--
		--BufferlineCloseButton      = { bg=h.ui.bg},
		--BufferlineCloseButtonVisible = { link='BufferlineBufferVisible' },
		--BufferlineCloseButtonSelected= { link='BufferlineBufferSelected' },
		--
		--BufferlineNumbers = { },
		--BufferlineNumbersVisible   = { link='BufferlineNumbers' },
		--BufferlineNumbersSelected  = { link='BufferlineBufferSelected' },
		--
		----BufferlineDiagnostic = { },
		----BufferlineDiagnosticVisible = { },
		----BufferlineDiagnosticSelected = { },
		----
		----BufferlineHint = { },
		----BufferlineHintVisible = { },
		----BufferlineHintSelected = { },
		----BufferlineHintDiagnostic = { },
		----BufferlineHintDiagnosticVisible = { },
		----BufferlineHintDiagnosticSelected = { },
		----
		----BufferlineInfo = { },
		----BufferlineInfoVisible = { },
		----BufferlineInfoSelected = { },
		----BufferlineInfoDiagnostic = { },
		----BufferlineInfoDiagnosticVisible = { },
		----BufferlineInfoDiagnosticSelected = { },
		----
		----BufferlineWarning = { },
		----BufferlineWarningVisible = { },
		----BufferlineWarningSelected = { },
		----BufferlineWarningDiagnostic = { },
		----BufferlineWarningDiagnosticVisible = { },
		----BufferlineWarningDiagnosticSelected = { },
		----
		----BufferlineError = { },
		----BufferlineErrorVisible = { },
		----BufferlineErrorSelected = { },
		----BufferlineErrorDiagnostic = { },
		----BufferlineErrorDiagnosticVisible = { },
		----BufferlineErrorDiagnosticSelected = { },
		--
		--BufferlineModified = { italic=true},
		--BufferlineModifiedVisible = { italic=true},
		--BufferlineModifiedSelected = { italic=true},
		----
		----BufferlineDuplicateSelected = { },
		----BufferlineDuplicateVisible = { },
		----BufferlineDuplicate = { },
		----
		----BufferlineSeparatorSelected = { },
		----BufferlineSeparatorVisible = { },
		----BufferlineSeparator = { },
		----
		----BufferlineIndicatorSelected = { },
		----BufferlinePickSelected = { },
		----BufferlinePickVisible = { },
		----BufferlinePick = { },
		----BufferlineOffsetSeparator = { },
	}

	return theme
end

return M
