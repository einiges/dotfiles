-- vim:ts=4 cc=38,53,68,83,98

return function(c)
	return {

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
		CursorLineNr               = { fg=c.purple.h, bg=c.c01.l  ,                bold=true    },
		ColorColumn                = { link='CursorLine'                                         },
		--lCursor                    = { fg=c.b0      , bg=c.b0                                    },
		--CursorIM                   = { fg=c.b0      , bg=c.b0                                    },

		LineNr                     = { fg=c.c1.h    , bg=c.c0.l    ,                bold=true    },
		LineNrAbove                = { fg=c.c4.l                                                 },
		LineNrBelow                = { link='LineNrAbove'                                        },

		DiffAdd                    = { fg=c.green.n ,                                            },
		DiffChange                 = { fg=c.yellow.n,                                            },
		DiffDelete                 = { fg=c.red.n   ,                                            },
		DiffText                   = { fg=c.blue.n  ,                                            },

		Directory                  = { fg=c.blue.n                                               },


		FoldColumn                 = { fg=c.gray.n  , bg=c.c1.l                                  },
		Folded                     = { fg=c.blue.l  ,                               italic=true },

		--MsgArea                    = {                                                           },
		--MsgSeparator               = {                                                           },
		ErrorMsg                   = { fg=c.red.n                                                },
		ModeMsg                    = { fg=c.yellow.n,                               bold=true    },
		MoreMsg                    = { fg=c.yellow.n,                               bold=true    },
		WarningMsg                 = { fg=c.red.n   ,                               bold=true    },

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

		Search                     = { fg=c.c0.h    , bg=c.yellow.l,                italic=true  },
		IncSearch                  = { fg=c.c0.h    , bg=c.yellow.n,                             },

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

		TermCursor                 = { fg=c.c3.l    , bg=c.c0.h                                  },
		TermCursorNC               = {                                                           },
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
		String                     = { fg=c.aqua.n  , bg=c.c1.l                                  },
		Character                  = { fg=c.aqua.h  ,                                            },
		Number                     = { fg=c.purple.n,                                            },
		Boolean                    = { fg=c.purple.n,                                            },
		Float                      = { fg=c.purple.n,                                            },

		Identifier                 = { fg=c.blue.n  ,                                            },
		Function                   = { fg=c.blue.n  ,                               bold=true    },

		Statement                  = { fg=c.green.n ,                                            },
		Conditional                = { fg=c.green.n ,                               bold=true    },
		Repeat                     = { fg=c.green.n ,                               bold=true    },
		Label                      = { fg=c.red.n   ,                               underline=true },
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
		SpecialComment             = { fg=c.red.n   ,                                            },
		Debug                      = { fg=c.red.n   ,                                            },

		Comment                    = { fg=c.gray.n  ,                                            },
		Error                      = { fg=c.red.n   ,                                            },
		Todo                       = { fg=c.purple.n,                               bold=true    },
		Underlined                 = {                                              underline=true },

		ConId                      = { fg=c.yellow.n,                                            },
		ExtraWhitespace            = {                bg=c.red.n                                 },
		VarId                      = { fg=c.blue.n  ,                                            },


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


		-- Treesitter (nvim-treesitter-highlights)
		--     https://github.com/nvim-treesitter/nvim-treesitter
		TSAttribute                = { fg=c.gray.n  ,                                            },
		TSBoolean                  = { link='Boolean'                                            },
		TSCharacter                = { link='Character'                                          },
		TSCharacterSpecial         = { fg=c.purple.n,                                            },
		TSComment                  = { link='Comment'                                            },
		TSConditional              = { link='Conditional'                                        },
		TSConstant                 = { link='Constant'                                           },
		-- TODO: Color
		TSConstBuiltin             = {                                              bold=true, italic=true},
		TSConstMacro               = { link='TSConstantBuiltin'                                  },
		TSConstructor              = { fg=c.blue.n  ,                               bold=true    },
		TSDebug                    = { link='Debug'                                              },
		TSDefine                   = { link='Define'                                             },
		-- While typing TSError may colorize large sections of code.
		TSError                    = {                                                           },
		TSException                = { link='Exception'                                          },
		--TSField                    = { fg=c.blue.n                                               },
		TSFloat                    = { link='Float'                                             },
		TSFunction                 = { link='Function'                                              },
		TSFuncBuiltin              = { link='TSFunction'                                         },
		TSFuncMacro                = { link='TSFunction'                                         },
		TSInclude                  = { link='Include'                                            },
		TSKeyword                  = { link='Keyword'                                            },
		--TSKeywordFunction          = {                                                           },
		--TSKeywordOperator          = {                                                           },
		TSKeywordReturn            = { fg=c.purple.h,                             bold=true, italic=true},
		TSLabel                    = { link='Label'                                              },
		--TSMethod                   = { fg=c.f1                                                   },
		--TSNamespace                = { fg=c.f1                                                   },
		TSNumber                   = { link='Number'                                             },
		TSOperator                 = { link='Operator'                                           },

		--TSParameter                = { fg=c.f1                                                   },
		--TSParameterReference       = { fg=c.f1                                                   },


		TSPunctDelimiter           = { fg=c.c0.h                                                 },
		TSPunctBracket             = { fg=c.blue.h                                               },
		--TSPunctSpecial             = { fg=c.gray.n                                               },

		TSRepeat                   = { link='Repeat'                                             },
		--TSStorageClass               = { },

		TSString                   = { link='String'                                              },
		TSStringRegex              = { fg=c.orange.n,                                             },
		TSStringEscape             = { fg=c.red.n   ,                                            },
		TSStringSpecial            = { fg=c.purple.n,                                            },

		--TSSymbol                   = {                                                           },

		TSTag                      = { link='Tag'                                                },
		TSTagAttribute             = { fg=c.aqua.n                                               },
		TSTagDelimiter             = { fg=c.blue.l                                               },

		TSText                     = { link='Normal'                                             },
		TSStrong                   = {                                              bold=true    },
		TSEmphasis                 = {                                              bold=true, underline=true },
		TSUnderline                = { link='Underlined'                                           },
		TSStrike                   = {                                              strikethrough=true },
		TSTitle                    = { fg=c.orange.n, bg=c.c1.l,                    bold=true    },
		TSLiteral                  = {                bg=c.c1.l,                                 },
		TSURI                      = { fg=c.blue.l  ,                               underline=true },
		--TSMath                     = {                                                           },
		TSTextReference            = { fg=c.c3.l    ,                                            },
		--TSEnvironment              = {                                              bold=true    },
		--TSEnvironmentName          = {                                              bold=true    },

		--TSNote                     = { fg=c.orange.n,                                            },
		--TSWarning                  = { fg=c.purple.n,                                            },
		--TSDanger                   = { fg=c.red.h   ,                               bold=true    },

		--TSType                     = {                                                           },
		--TSTypeBuiltin              = {                                                           },
		--TSTypeQualifier            = {}
		--TSTypeDefinition

		--TSVariable                 = { fg=c.blue.n                                               },
		--TSVariableBuiltin          = { fg=c.blue.n                                               },


		-- https://github.com/nvim-treesitter/nvim-treesitter-refactor
		-- TSDefinition
		-- TSDefinitionUsage
		-- TSCurrentScope


		-- LSP
		-- Diagnostic (diagnostic-highlights)
		DiagnosticError            = { fg=c.red.h   ,                                            },
		DiagnosticWarn             = { fg=c.purple.h,                                            },
		DiagnosticInfo             = { fg=c.blue.h  ,                                            },
		DiagnosticHint             = { fg=c.green.h ,                                            },
		DiagnosticVirtualError     = { fg=c.red.h   ,                                            },
		DiagnosticVirtualWarn      = { fg=c.purple.h,                                            },
		DiagnosticVirtualInfo      = { fg=c.blue.h  ,                                            },
		DiagnosticVirtualHint      = { fg=c.green.h ,                                            },
		DiagnosticUnderlineError   = { fg=c.red.h   ,                               underline=true },
		DiagnosticUnderlineWarn    = { fg=c.purple.h,                               underline=true },
		DiagnosticUnderlineInfo    = { fg=c.blue.h  ,                               underline=true },
		DiagnosticUnderlineHint    = { fg=c.green.h ,                               underline=true },
		DiagnosticFloatingError    = { fg=c.red.h   ,                                            },
		DiagnosticFloatingWarn     = { fg=c.purple.h,                                            },
		DiagnosticFloatingInfo     = { fg=c.blue.h  ,                                            },
		DiagnosticFloatingHint     = { fg=c.green.h ,                                            },
		DiagnosticSignError        = { fg=c.red.h   ,                                            },
		DiagnosticSignWarn         = { fg=c.purple.h,                                            },
		DiagnosticSignInfo         = { fg=c.blue.h  ,                                            },
		DiagnosticSignHint         = { fg=c.green.h ,                                            },

		--LspReferenceRead           = {                                                           },
		--LspReferenceText           = {                                                           },
		--LspReferenceWrite          = {                                                           },

		-- Diff
		--DiffDelete
		--DiffChange
		--DiffText
		--DiffAdd

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

		-- https://github.com/folke/todo-comments.nvim

		-- https://github.com/j-hui/fidget.nvim
		--FidgetTitle
		--FidgetTask
	}
end

