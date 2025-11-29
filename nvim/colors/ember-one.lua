-- Ember One for Neovim
-- Personal color scheme by Donnie Adams
-- Install as: ~/.config/nvim/colors/ember-one.lua
-- Use with:  vim.cmd.colorscheme("ember-one")

vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "ember-one"

local c = {
  black = "#191D24",
  bg = "#20242C",
  bg2 = "#282E37",
  ui = "#303743",
  ui2 = "#37404D",
  ui3 = "#3F4F66",
  ui4 = "#434D5B",

  tx3 = "#7F8998",
  tx2 = "#AAB4C0",
  tx = "#E1E6EC",
  tx_strong = "#F5F7FA",

  hint = "#8792A0",
  comment = "#788391",
  comment_doc = "#9CA7B3",

  red = "#EA5670",
  orange = "#F58B45",
  yellow = "#DDBB52",
  green = "#99C45C",
  cyan = "#36CDBB",
  blue = "#5FAAF7",
  purple = "#B96EF2",
  magenta = "#E655A7",

  none = "NONE",
}

local function hl(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
  hl(group, { link = target })
end

-- Editor ---------------------------------------------------------------------
hl("Normal", { fg = c.tx, bg = c.bg })
hl("NormalNC", { fg = c.tx, bg = c.bg })
hl("NormalFloat", { fg = c.tx, bg = c.bg2 })
hl("FloatBorder", { fg = c.ui4, bg = c.bg2 })
hl("FloatTitle", { fg = c.blue, bg = c.bg2, bold = true })

hl("Cursor", { fg = c.bg, bg = c.blue })
hl("lCursor", { fg = c.bg, bg = c.blue })
hl("CursorIM", { fg = c.bg, bg = c.blue })
hl("CursorLine", { bg = c.ui })
hl("CursorColumn", { bg = c.ui })
hl("ColorColumn", { bg = c.bg2 })

hl("LineNr", { fg = c.tx3, bg = c.bg })
hl("CursorLineNr", { fg = c.tx, bg = c.ui, bold = true })
hl("SignColumn", { fg = c.tx3, bg = c.bg })
hl("FoldColumn", { fg = c.tx3, bg = c.bg })
hl("Folded", { fg = c.tx2, bg = c.bg2 })

hl("WinSeparator", { fg = c.ui4, bg = c.bg })
hl("VertSplit", { fg = c.ui4, bg = c.bg })

hl("Visual", { bg = c.ui3 })
hl("VisualNOS", { bg = c.ui3 })
hl("Search", { fg = c.black, bg = c.yellow })
hl("IncSearch", { fg = c.black, bg = c.orange })
hl("CurSearch", { fg = c.black, bg = c.orange, bold = true })
hl("Substitute", { fg = c.black, bg = c.magenta })
hl("MatchParen", { fg = c.orange, bg = c.ui3, bold = true })

hl("NonText", { fg = c.ui4 })
hl("SpecialKey", { fg = c.ui4 })
hl("Whitespace", { fg = c.ui4 })
hl("EndOfBuffer", { fg = c.bg })

hl("Directory", { fg = c.blue })
hl("Title", { fg = c.red, bold = true })
hl("Question", { fg = c.green })
hl("MoreMsg", { fg = c.green })
hl("ModeMsg", { fg = c.orange })
hl("WarningMsg", { fg = c.yellow })
hl("ErrorMsg", { fg = c.red, bold = true })

-- Menus and command line -----------------------------------------------------
hl("Pmenu", { fg = c.tx, bg = c.bg2 })
hl("PmenuSel", { fg = c.tx_strong, bg = c.ui3 })
hl("PmenuSbar", { bg = c.ui })
hl("PmenuThumb", { bg = c.tx3 })
hl("WildMenu", { fg = c.tx_strong, bg = c.ui3 })

hl("MsgArea", { fg = c.tx, bg = c.bg })
hl("MsgSeparator", { fg = c.ui4, bg = c.bg })
hl("CommandLine", { fg = c.tx, bg = c.bg2 })

-- Tabs, status, winbar -------------------------------------------------------
hl("StatusLine", { fg = c.tx, bg = c.bg2 })
hl("StatusLineNC", { fg = c.tx3, bg = c.black })
hl("TabLine", { fg = c.tx2, bg = c.bg2 })
hl("TabLineSel", { fg = c.tx_strong, bg = c.bg })
hl("TabLineFill", { bg = c.bg2 })
hl("WinBar", { fg = c.tx2, bg = c.bg })
hl("WinBarNC", { fg = c.tx3, bg = c.bg })

-- Diffs ----------------------------------------------------------------------
hl("DiffAdd", { fg = c.green, bg = "#2C3431" })
hl("DiffChange", { fg = c.yellow, bg = "#333330" })
hl("DiffDelete", { fg = c.red, bg = "#352933" })
hl("DiffText", { fg = c.orange, bg = "#4B3931", bold = true })

-- Diagnostics ----------------------------------------------------------------
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.yellow })
hl("DiagnosticInfo", { fg = c.blue })
hl("DiagnosticHint", { fg = c.hint })
hl("DiagnosticOk", { fg = c.green })

hl("DiagnosticVirtualTextError", { fg = c.red, bg = "#302831" })
hl("DiagnosticVirtualTextWarn", { fg = c.yellow, bg = "#2F302F" })
hl("DiagnosticVirtualTextInfo", { fg = c.blue, bg = "#252F3C" })
hl("DiagnosticVirtualTextHint", { fg = c.hint, bg = "#282D35" })
hl("DiagnosticVirtualTextOk", { fg = c.green, bg = "#293130" })

hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = c.blue, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = c.hint, undercurl = true })
hl("DiagnosticUnderlineOk", { sp = c.green, undercurl = true })

hl("DiagnosticFloatingError", { fg = c.red })
hl("DiagnosticFloatingWarn", { fg = c.yellow })
hl("DiagnosticFloatingInfo", { fg = c.blue })
hl("DiagnosticFloatingHint", { fg = c.hint })
hl("DiagnosticFloatingOk", { fg = c.green })

hl("DiagnosticSignError", { fg = c.red, bg = c.bg })
hl("DiagnosticSignWarn", { fg = c.yellow, bg = c.bg })
hl("DiagnosticSignInfo", { fg = c.blue, bg = c.bg })
hl("DiagnosticSignHint", { fg = c.hint, bg = c.bg })
hl("DiagnosticSignOk", { fg = c.green, bg = c.bg })

hl("DiagnosticUnnecessary", { fg = c.tx3, italic = true })
hl("DiagnosticDeprecated", { fg = c.tx3, strikethrough = true })

-- Classic syntax -------------------------------------------------------------
hl("Comment", { fg = c.comment, italic = true })
hl("SpecialComment", { fg = c.comment_doc, italic = true })

hl("Constant", { fg = c.yellow })
hl("String", { fg = c.green })
hl("Character", { fg = c.green })
hl("Number", { fg = c.orange })
hl("Boolean", { fg = c.orange })
hl("Float", { fg = c.orange })

hl("Identifier", { fg = c.tx })
hl("Function", { fg = c.blue })

hl("Statement", { fg = c.purple })
hl("Conditional", { fg = c.purple })
hl("Repeat", { fg = c.purple })
hl("Label", { fg = c.blue })
hl("Operator", { fg = c.magenta })
hl("Keyword", { fg = c.purple })
hl("Exception", { fg = c.purple })

hl("PreProc", { fg = c.purple })
hl("Include", { fg = c.purple })
hl("Define", { fg = c.purple })
hl("Macro", { fg = c.purple })
hl("PreCondit", { fg = c.purple })

hl("Type", { fg = c.cyan })
hl("StorageClass", { fg = c.purple })
hl("Structure", { fg = c.cyan })
hl("Typedef", { fg = c.cyan })

hl("Special", { fg = c.orange })
hl("SpecialChar", { fg = c.cyan })
hl("Tag", { fg = c.blue })
hl("Delimiter", { fg = c.tx2 })
hl("Debug", { fg = c.red })

hl("Underlined", { fg = c.blue, underline = true })
hl("Ignore", { fg = c.tx3 })
hl("Error", { fg = c.red, bold = true })
hl("Todo", { fg = c.black, bg = c.yellow, bold = true })

-- Treesitter -----------------------------------------------------------------
hl("@attribute", { fg = c.cyan })
hl("@boolean", { fg = c.orange })
hl("@character", { fg = c.green })
hl("@character.special", { fg = c.cyan })
hl("@comment", { fg = c.comment, italic = true })
hl("@comment.documentation", { fg = c.comment_doc, italic = true })
hl("@constant", { fg = c.yellow })
hl("@constant.builtin", { fg = c.orange })
hl("@constant.macro", { fg = c.yellow })
hl("@constructor", { fg = c.cyan })
hl("@diff.plus", { fg = c.green })
hl("@diff.minus", { fg = c.red })
hl("@diff.delta", { fg = c.yellow })
hl("@function", { fg = c.blue })
hl("@function.builtin", { fg = c.blue })
hl("@function.call", { fg = c.blue })
hl("@function.macro", { fg = c.blue })
hl("@function.method", { fg = c.blue })
hl("@function.method.call", { fg = c.blue })
hl("@keyword", { fg = c.purple })
hl("@keyword.conditional", { fg = c.purple })
hl("@keyword.coroutine", { fg = c.purple })
hl("@keyword.debug", { fg = c.red })
hl("@keyword.directive", { fg = c.purple })
hl("@keyword.directive.define", { fg = c.purple })
hl("@keyword.exception", { fg = c.purple })
hl("@keyword.function", { fg = c.purple })
hl("@keyword.import", { fg = c.purple })
hl("@keyword.operator", { fg = c.magenta })
hl("@keyword.repeat", { fg = c.purple })
hl("@keyword.return", { fg = c.purple })
hl("@label", { fg = c.blue })
hl("@markup.heading", { fg = c.red, bold = true })
hl("@markup.heading.1", { fg = c.red, bold = true })
hl("@markup.heading.2", { fg = c.orange, bold = true })
hl("@markup.heading.3", { fg = c.yellow, bold = true })
hl("@markup.heading.4", { fg = c.green, bold = true })
hl("@markup.heading.5", { fg = c.cyan, bold = true })
hl("@markup.heading.6", { fg = c.blue, bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.link", { fg = c.blue })
hl("@markup.link.label", { fg = c.blue, italic = true })
hl("@markup.link.url", { fg = c.cyan, underline = true })
hl("@markup.list", { fg = c.red })
hl("@markup.raw", { fg = c.green })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.strong", { bold = true })
hl("@markup.underline", { underline = true })
hl("@module", { fg = c.tx })
hl("@namespace", { fg = c.tx })
hl("@none", { fg = c.tx })
hl("@number", { fg = c.orange })
hl("@number.float", { fg = c.orange })
hl("@operator", { fg = c.magenta })
hl("@property", { fg = c.red })
hl("@punctuation.bracket", { fg = c.tx })
hl("@punctuation.delimiter", { fg = c.tx2 })
hl("@punctuation.special", { fg = c.magenta })
hl("@string", { fg = c.green })
hl("@string.documentation", { fg = c.green })
hl("@string.escape", { fg = c.cyan })
hl("@string.regexp", { fg = c.magenta })
hl("@string.special", { fg = c.orange })
hl("@string.special.path", { fg = c.green })
hl("@string.special.symbol", { fg = c.orange })
hl("@tag", { fg = c.blue })
hl("@tag.attribute", { fg = c.cyan })
hl("@tag.delimiter", { fg = c.tx2 })
hl("@type", { fg = c.cyan })
hl("@type.builtin", { fg = c.cyan })
hl("@type.definition", { fg = c.cyan })
hl("@type.qualifier", { fg = c.purple })
hl("@variable", { fg = c.tx })
hl("@variable.builtin", { fg = c.orange })
hl("@variable.member", { fg = c.red })
hl("@variable.parameter", { fg = c.tx })
hl("@variable.parameter.builtin", { fg = c.orange })

-- LSP semantic tokens --------------------------------------------------------
link("@lsp.type.boolean", "@boolean")
link("@lsp.type.builtinType", "@type.builtin")
link("@lsp.type.class", "@type")
link("@lsp.type.comment", "@comment")
link("@lsp.type.decorator", "@attribute")
link("@lsp.type.enum", "@type")
link("@lsp.type.enumMember", "@constant")
link("@lsp.type.event", "@type")
link("@lsp.type.function", "@function")
link("@lsp.type.interface", "@type")
link("@lsp.type.keyword", "@keyword")
link("@lsp.type.macro", "@function.macro")
link("@lsp.type.method", "@function.method")
link("@lsp.type.modifier", "@keyword")
link("@lsp.type.namespace", "@module")
link("@lsp.type.number", "@number")
link("@lsp.type.operator", "@operator")
link("@lsp.type.parameter", "@variable.parameter")
link("@lsp.type.property", "@property")
link("@lsp.type.regexp", "@string.regexp")
link("@lsp.type.string", "@string")
link("@lsp.type.struct", "@type")
link("@lsp.type.type", "@type")
link("@lsp.type.typeParameter", "@type")
link("@lsp.type.variable", "@variable")

hl("@lsp.mod.deprecated", { fg = c.tx3, strikethrough = true })
hl("@lsp.mod.readonly", { fg = c.yellow })
hl("@lsp.mod.defaultLibrary", { fg = c.cyan })

-- Git and VCS ----------------------------------------------------------------
hl("Added", { fg = c.green })
hl("Changed", { fg = c.yellow })
hl("Removed", { fg = c.red })

hl("GitSignsAdd", { fg = c.green, bg = c.bg })
hl("GitSignsChange", { fg = c.yellow, bg = c.bg })
hl("GitSignsDelete", { fg = c.red, bg = c.bg })
hl("GitSignsAddNr", { fg = c.green, bg = c.bg })
hl("GitSignsChangeNr", { fg = c.yellow, bg = c.bg })
hl("GitSignsDeleteNr", { fg = c.red, bg = c.bg })
hl("GitSignsAddLn", { bg = "#293130" })
hl("GitSignsChangeLn", { bg = "#2F302F" })
hl("GitSignsDeleteLn", { bg = "#302831" })

-- Completion -----------------------------------------------------------------
hl("CmpItemAbbr", { fg = c.tx })
hl("CmpItemAbbrDeprecated", { fg = c.tx3, strikethrough = true })
hl("CmpItemAbbrMatch", { fg = c.blue, bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = c.blue, bold = true })
hl("CmpItemMenu", { fg = c.hint })
hl("CmpItemKind", { fg = c.purple })
hl("CmpItemKindText", { fg = c.tx })
hl("CmpItemKindMethod", { fg = c.blue })
hl("CmpItemKindFunction", { fg = c.blue })
hl("CmpItemKindConstructor", { fg = c.cyan })
hl("CmpItemKindField", { fg = c.red })
hl("CmpItemKindVariable", { fg = c.tx })
hl("CmpItemKindClass", { fg = c.cyan })
hl("CmpItemKindInterface", { fg = c.cyan })
hl("CmpItemKindModule", { fg = c.tx })
hl("CmpItemKindProperty", { fg = c.red })
hl("CmpItemKindUnit", { fg = c.orange })
hl("CmpItemKindValue", { fg = c.orange })
hl("CmpItemKindEnum", { fg = c.cyan })
hl("CmpItemKindKeyword", { fg = c.purple })
hl("CmpItemKindSnippet", { fg = c.green })
hl("CmpItemKindColor", { fg = c.magenta })
hl("CmpItemKindFile", { fg = c.blue })
hl("CmpItemKindReference", { fg = c.cyan })
hl("CmpItemKindFolder", { fg = c.blue })
hl("CmpItemKindEnumMember", { fg = c.yellow })
hl("CmpItemKindConstant", { fg = c.yellow })
hl("CmpItemKindStruct", { fg = c.cyan })
hl("CmpItemKindEvent", { fg = c.orange })
hl("CmpItemKindOperator", { fg = c.magenta })
hl("CmpItemKindTypeParameter", { fg = c.cyan })

-- blink.cmp
hl("BlinkCmpMenu", { fg = c.tx, bg = c.bg2 })
hl("BlinkCmpMenuBorder", { fg = c.ui4, bg = c.bg2 })
hl("BlinkCmpMenuSelection", { fg = c.tx_strong, bg = c.ui3 })
hl("BlinkCmpLabel", { fg = c.tx })
hl("BlinkCmpLabelMatch", { fg = c.blue, bold = true })
hl("BlinkCmpLabelDeprecated", { fg = c.tx3, strikethrough = true })
hl("BlinkCmpKind", { fg = c.purple })
hl("BlinkCmpSource", { fg = c.hint })
hl("BlinkCmpDoc", { fg = c.tx, bg = c.bg2 })
hl("BlinkCmpDocBorder", { fg = c.ui4, bg = c.bg2 })
hl("BlinkCmpSignatureHelp", { fg = c.tx, bg = c.bg2 })
hl("BlinkCmpSignatureHelpBorder", { fg = c.ui4, bg = c.bg2 })

-- Telescope ------------------------------------------------------------------
hl("TelescopeNormal", { fg = c.tx, bg = c.bg2 })
hl("TelescopeBorder", { fg = c.ui4, bg = c.bg2 })
hl("TelescopePromptNormal", { fg = c.tx, bg = c.ui })
hl("TelescopePromptBorder", { fg = c.ui4, bg = c.ui })
hl("TelescopePromptTitle", { fg = c.black, bg = c.blue, bold = true })
hl("TelescopePreviewTitle", { fg = c.black, bg = c.green, bold = true })
hl("TelescopeResultsTitle", { fg = c.black, bg = c.purple, bold = true })
hl("TelescopeSelection", { fg = c.tx_strong, bg = c.ui3 })
hl("TelescopeSelectionCaret", { fg = c.orange, bg = c.ui3 })
hl("TelescopeMatching", { fg = c.blue, bold = true })

-- File explorers -------------------------------------------------------------
hl("NvimTreeNormal", { fg = c.tx, bg = c.bg2 })
hl("NvimTreeNormalNC", { fg = c.tx, bg = c.bg2 })
hl("NvimTreeEndOfBuffer", { fg = c.bg2, bg = c.bg2 })
hl("NvimTreeRootFolder", { fg = c.blue, bold = true })
hl("NvimTreeFolderName", { fg = c.blue })
hl("NvimTreeOpenedFolderName", { fg = c.blue, bold = true })
hl("NvimTreeGitDirty", { fg = c.yellow })
hl("NvimTreeGitNew", { fg = c.green })
hl("NvimTreeGitDeleted", { fg = c.red })
hl("NvimTreeIndentMarker", { fg = c.ui4 })

hl("NeoTreeNormal", { fg = c.tx, bg = c.bg2 })
hl("NeoTreeNormalNC", { fg = c.tx, bg = c.bg2 })
hl("NeoTreeEndOfBuffer", { fg = c.bg2, bg = c.bg2 })
hl("NeoTreeDirectoryName", { fg = c.blue })
hl("NeoTreeDirectoryIcon", { fg = c.blue })
hl("NeoTreeRootName", { fg = c.blue, bold = true })
hl("NeoTreeGitAdded", { fg = c.green })
hl("NeoTreeGitModified", { fg = c.yellow })
hl("NeoTreeGitDeleted", { fg = c.red })
hl("NeoTreeGitUntracked", { fg = c.green })
hl("NeoTreeIndentMarker", { fg = c.ui4 })

-- UI plugins -----------------------------------------------------------------
hl("WhichKey", { fg = c.blue })
hl("WhichKeyGroup", { fg = c.purple })
hl("WhichKeyDesc", { fg = c.tx })
hl("WhichKeySeparator", { fg = c.tx3 })
hl("WhichKeyValue", { fg = c.hint })
hl("WhichKeyFloat", { bg = c.bg2 })
hl("WhichKeyBorder", { fg = c.ui4, bg = c.bg2 })

hl("LazyNormal", { fg = c.tx, bg = c.bg2 })
hl("LazyButton", { fg = c.tx, bg = c.ui })
hl("LazyButtonActive", { fg = c.tx_strong, bg = c.ui3, bold = true })
hl("LazyH1", { fg = c.black, bg = c.blue, bold = true })
hl("LazyH2", { fg = c.blue, bold = true })
hl("LazySpecial", { fg = c.orange })
hl("LazyReasonPlugin", { fg = c.purple })
hl("LazyReasonStart", { fg = c.green })
hl("LazyReasonEvent", { fg = c.yellow })
hl("LazyReasonCmd", { fg = c.orange })
hl("LazyReasonFt", { fg = c.cyan })
hl("LazyReasonKeys", { fg = c.magenta })

hl("MasonNormal", { fg = c.tx, bg = c.bg2 })
hl("MasonHeader", { fg = c.black, bg = c.blue, bold = true })
hl("MasonHeaderSecondary", { fg = c.black, bg = c.purple, bold = true })
hl("MasonHighlight", { fg = c.blue })
hl("MasonHighlightBlock", { fg = c.black, bg = c.blue })
hl("MasonHighlightBlockBold", { fg = c.black, bg = c.blue, bold = true })
hl("MasonMuted", { fg = c.hint })
hl("MasonMutedBlock", { fg = c.tx2, bg = c.ui })

hl("TroubleNormal", { fg = c.tx, bg = c.bg2 })
hl("TroubleText", { fg = c.tx })
hl("TroubleCount", { fg = c.purple, bg = c.ui })
hl("TroubleIndent", { fg = c.ui4 })

hl("NoiceCmdlinePopup", { fg = c.tx, bg = c.bg2 })
hl("NoiceCmdlinePopupBorder", { fg = c.blue, bg = c.bg2 })
hl("NoiceCmdlineIcon", { fg = c.blue })
hl("NoiceConfirm", { fg = c.tx, bg = c.bg2 })
hl("NoiceConfirmBorder", { fg = c.ui4, bg = c.bg2 })

hl("TreesitterContext", { bg = c.bg2 })
hl("TreesitterContextLineNumber", { fg = c.blue, bg = c.bg2 })
hl("TreesitterContextSeparator", { fg = c.ui4, bg = c.bg2 })

hl("IblIndent", { fg = c.ui4 })
hl("IblScope", { fg = c.blue })
hl("IndentBlanklineChar", { fg = c.ui4 })
hl("IndentBlanklineContextChar", { fg = c.blue })
hl("IndentBlanklineContextStart", { sp = c.blue, underline = true })

hl("MiniStatuslineModeNormal", { fg = c.black, bg = c.blue, bold = true })
hl("MiniStatuslineModeInsert", { fg = c.black, bg = c.green, bold = true })
hl("MiniStatuslineModeVisual", { fg = c.black, bg = c.purple, bold = true })
hl("MiniStatuslineModeReplace", { fg = c.black, bg = c.red, bold = true })
hl("MiniStatuslineModeCommand", { fg = c.black, bg = c.orange, bold = true })
hl("MiniStatuslineModeOther", { fg = c.black, bg = c.cyan, bold = true })
hl("MiniStatuslineDevinfo", { fg = c.tx2, bg = c.bg2 })
hl("MiniStatuslineFilename", { fg = c.tx, bg = c.ui })
hl("MiniStatuslineFileinfo", { fg = c.tx2, bg = c.bg2 })
hl("MiniStatuslineInactive", { fg = c.tx3, bg = c.black })

hl("SnacksPicker", { fg = c.tx, bg = c.bg2 })
hl("SnacksPickerBorder", { fg = c.ui4, bg = c.bg2 })
hl("SnacksPickerMatch", { fg = c.blue, bold = true })
hl("SnacksPickerCursorLine", { bg = c.ui3 })

-- Terminal colors ------------------------------------------------------------
vim.g.terminal_color_0 = c.bg
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.purple
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.tx

vim.g.terminal_color_8 = "#56606E"
vim.g.terminal_color_9 = "#F07186"
vim.g.terminal_color_10 = "#B8DA74"
vim.g.terminal_color_11 = "#EAC767"
vim.g.terminal_color_12 = "#82BEFA"
vim.g.terminal_color_13 = "#CE8BFA"
vim.g.terminal_color_14 = "#61DDCF"
vim.g.terminal_color_15 = c.tx_strong
