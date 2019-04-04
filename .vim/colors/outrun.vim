" -----------------------------------------------------------------------------
" File: outrun.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/outrun
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='outrun'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:outrun_bold')
  let g:outrun_bold=1
endif
if !exists('g:outrun_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:outrun_italic=1
  else
    let g:outrun_italic=0
  endif
endif
if !exists('g:outrun_undercurl')
  let g:outrun_undercurl=1
endif
if !exists('g:outrun_underline')
  let g:outrun_underline=1
endif
if !exists('g:outrun_inverse')
  let g:outrun_inverse=1
endif

if !exists('g:outrun_guisp_fallback') || index(['fg', 'bg'], g:outrun_guisp_fallback) == -1
  let g:outrun_guisp_fallback='NONE'
endif

if !exists('g:outrun_improved_strings')
  let g:outrun_improved_strings=0
endif

if !exists('g:outrun_improved_warnings')
  let g:outrun_improved_warnings=0
endif

if !exists('g:outrun_termcolors')
  let g:outrun_termcolors=256
endif

if !exists('g:outrun_invert_indent_guides')
  let g:outrun_invert_indent_guides=0
endif

if exists('g:outrun_contrast')
  echo 'g:outrun_contrast is deprecated; use g:outrun_contrast_light and g:outrun_contrast_dark instead'
endif

if !exists('g:outrun_contrast_dark')
  let g:outrun_contrast_dark='medium'
endif

if !exists('g:outrun_contrast_light')
  let g:outrun_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#0D011E', 233]     " 29-32-33
let s:gb.dark0       = ['#0D011E', 233]     " 40-40-40 NEW
let s:gb.dark0_soft  = ['#0D011E', 233]     " 50-48-47
let s:gb.dark1       = ['#251A35', 235]     " 60-56-54 NEW
let s:gb.dark2       = ['#3D344B', 237]     " 80-73-69 NEW
let s:gb.dark3       = ['#564D62', 240]     " 102-92-84 NEW
let s:gb.dark4       = ['#6E6778', 242]     " 124-111-100 NEW
let s:gb.dark4_256   = ['#6E6778', 242]     " 124-111-100 NEW

let s:gb.gray_245    = ['#6272A4', 245]     " 146-131-116 NEW
let s:gb.gray_244    = ['#6272A4', 244]     " 146-131-116 NEW

let s:gb.light0_hard = ['#FFFFD8', 230]     " 249-245-215
let s:gb.light0      = ['#FFFFD8', 230]     " 253-244-193 NEW
let s:gb.light0_soft = ['#FFFFD8', 230]     " 242-229-188
let s:gb.light1      = ['#E6E6C2', 187]     " 235-219-178 NEW
let s:gb.light2      = ['#CCCCAD', 187]     " 213-196-161 NEW
let s:gb.light3      = ['#B3B397', 144]     " 189-174-147 NEW
let s:gb.light4      = ['#BD93F9', 246]     " 168-153-132 NEW
let s:gb.light4_256  = ['#999982', 246]     " 168-153-132 NEW

"let s:gb.bright_red     = ['#FF5555', 167]     " 251-73-52
"let s:gb.bright_green   = ['#50FA7B', 142]     " 184-187-38
"let s:gb.bright_yellow  = ['#F1FA8C', 214]     " 250-189-47
"let s:gb.bright_blue    = ['#BD93F9', 109]     " 131-165-152
"let s:gb.bright_purple  = ['#FF79C6', 175]     " 211-134-155
"let s:gb.bright_aqua    = ['#8BE9FD', 108]     " 142-192-124
"let s:gb.bright_orange  = ['#F8F8F2', 208]     " 254-128-25

let s:gb.bright_red     = ['#FD1D53', 197]     " 251-73-52 NEW
let s:gb.bright_green   = ['#50FA7B', 84 ]     " 184-187-38 NEW
let s:gb.bright_yellow  = ['#FFFA50', 228]     " 250-189-47 NEW
let s:gb.bright_blue    = ['#2BDCFF', 141]     " 131-165-152 NEW
let s:gb.bright_purple  = ['#BD93F9', 212]     " 211-134-155 NEW
let s:gb.bright_aqua    = ['#BDF3FF', 117]     " 142-192-124 NEW
let s:gb.bright_orange  = ['#FD947C', 255]     " 254-128-25 NEW

let s:gb.neutral_red    = ['#FF5555', 197]     " 204-36-29 NEW
let s:gb.neutral_green  = ['#50FA7B', 84 ]     " 152-151-26 NEW
let s:gb.neutral_yellow = ['#F1FA8C', 228]     " 215-153-33 NEW
let s:gb.neutral_blue   = ['#BD93F9', 141]      " 69-133-136 NEW
let s:gb.neutral_purple = ['#FF79C6', 212]     " 177-98-134 NEW
let s:gb.neutral_aqua   = ['#8BE9FD', 117]      " 104-157-106 NEW
let s:gb.neutral_orange = ['#F8F8F2', 255]     " 214-93-14 NEW

let s:gb.faded_red      = ['#FF6E6E', 203]      " 157-0-6 NEW
let s:gb.faded_green    = ['#69FF94', 84 ]     " 121-116-14 NEW
let s:gb.faded_yellow   = ['#FFFFA5', 229]     " 181-118-20 NEW
let s:gb.faded_blue     = ['#D6ACFF', 183]      " 7-102-120 NEW
let s:gb.faded_purple   = ['#FF92DF', 212]      " 143-63-113 NEW
let s:gb.faded_aqua     = ['#A4FFFF', 159]      " 66-123-88 NEW
let s:gb.faded_orange   = ['#FFFFFF', 231]     " 175-58-3 NEW

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:outrun_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:outrun_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:outrun_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:outrun_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:outrun_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:outrun_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:outrun_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:outrun_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:outrun_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:outrun_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:outrun_hls_cursor')
  let s:hls_cursor = get(s:gb, g:outrun_hls_cursor)
endif

let s:number_column = s:none
if exists('g:outrun_number_column')
  let s:number_column = get(s:gb, g:outrun_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:outrun_sign_column')
    let s:sign_column = get(s:gb, g:outrun_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:outrun_color_column')
  let s:color_column = get(s:gb, g:outrun_color_column)
endif

let s:vert_split = s:bg0
if exists('g:outrun_vert_split')
  let s:vert_split = get(s:gb, g:outrun_vert_split)
endif

let s:invert_signs = ''
if exists('g:outrun_invert_signs')
  if g:outrun_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:outrun_invert_selection')
  if g:outrun_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:outrun_invert_tabline')
  if g:outrun_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:outrun_italicize_comments')
  if g:outrun_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:outrun_italicize_strings')
  if g:outrun_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:outrun_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:outrun_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Outrun Hi Groups: {{{

" memoize common hi groups
call s:HL('OutrunFg0', s:fg0)
call s:HL('OutrunFg1', s:fg1)
call s:HL('OutrunFg2', s:fg2)
call s:HL('OutrunFg3', s:fg3)
call s:HL('OutrunFg4', s:fg4)
call s:HL('OutrunGray', s:gray)
call s:HL('OutrunBg0', s:bg0)
call s:HL('OutrunBg1', s:bg1)
call s:HL('OutrunBg2', s:bg2)
call s:HL('OutrunBg3', s:bg3)
call s:HL('OutrunBg4', s:bg4)

call s:HL('OutrunRed', s:red)
call s:HL('OutrunRedBold', s:red, s:none, s:bold)
call s:HL('OutrunGreen', s:green)
call s:HL('OutrunGreenBold', s:green, s:none, s:bold)
call s:HL('OutrunYellow', s:yellow)
call s:HL('OutrunYellowBold', s:yellow, s:none, s:bold)
call s:HL('OutrunBlue', s:blue)
call s:HL('OutrunBlueBold', s:blue, s:none, s:bold)
call s:HL('OutrunPurple', s:purple)
call s:HL('OutrunPurpleBold', s:purple, s:none, s:bold)
call s:HL('OutrunAqua', s:aqua)
call s:HL('OutrunAquaBold', s:aqua, s:none, s:bold)
call s:HL('OutrunOrange', s:orange)
call s:HL('OutrunOrangeBold', s:orange, s:none, s:bold)

call s:HL('OutrunRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('OutrunGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('OutrunYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('OutrunBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('OutrunPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('OutrunAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/outrun/issues/7
"if s:is_dark
"  set background=dark
"else
"  set background=light
"endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText OutrunBg2
hi! link SpecialKey OutrunBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg4, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory OutrunGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title OutrunGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg OutrunYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg OutrunYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question OutrunOrangeBold
" Warning messages
hi! link WarningMsg OutrunRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:outrun_improved_strings == 0
  hi! link Special OutrunOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement OutrunRed
" if, then, else, endif, swicth, etc.
hi! link Conditional OutrunRed
" for, do, while, etc.
hi! link Repeat OutrunRed
" case, default, etc.
hi! link Label OutrunRed
" try, catch, throw
hi! link Exception OutrunRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword OutrunRed

" Variable name
hi! link Identifier OutrunBlue
" Function name
hi! link Function OutrunGreenBold

" Generic preprocessor
hi! link PreProc OutrunAqua
" Preprocessor #include
hi! link Include OutrunAqua
" Preprocessor #define
hi! link Define OutrunAqua
" Same as Define
hi! link Macro OutrunAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit OutrunAqua

" Generic constant
hi! link Constant OutrunPurple
" Character constant: 'c', '/n'
hi! link Character OutrunPurple
" String constant: "this is a string"
if g:outrun_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean OutrunPurple
" Number constant: 234, 0xff
hi! link Number OutrunPurple
" Floating point constant: 2.3e10
hi! link Float OutrunPurple

" Generic type
hi! link Type OutrunYellow
" static, register, volatile, etc
hi! link StorageClass OutrunOrange
" struct, union, enum, etc.
hi! link Structure OutrunAqua
" typedef
hi! link Typedef OutrunYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:outrun_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:outrun_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd OutrunGreenSign
hi! link GitGutterChange OutrunAquaSign
hi! link GitGutterDelete OutrunRedSign
hi! link GitGutterChangeDelete OutrunAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile OutrunGreen
hi! link gitcommitDiscardedFile OutrunRed

" }}}
" Signify: {{{

hi! link SignifySignAdd OutrunGreenSign
hi! link SignifySignChange OutrunAquaSign
hi! link SignifySignDelete OutrunRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign OutrunRedSign
hi! link SyntasticWarningSign OutrunYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   OutrunBlueSign
hi! link SignatureMarkerText OutrunPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl OutrunBlueSign
hi! link ShowMarksHLu OutrunBlueSign
hi! link ShowMarksHLo OutrunBlueSign
hi! link ShowMarksHLm OutrunBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch OutrunYellow
hi! link CtrlPNoEntries OutrunRed
hi! link CtrlPPrtBase OutrunBg2
hi! link CtrlPPrtCursor OutrunBlue
hi! link CtrlPLinePre OutrunBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket OutrunFg3
hi! link StartifyFile OutrunFg1
hi! link StartifyNumber OutrunBlue
hi! link StartifyPath OutrunGray
hi! link StartifySlash OutrunGray
hi! link StartifySection OutrunYellow
hi! link StartifySpecial OutrunBg2
hi! link StartifyHeader OutrunOrange
hi! link StartifyFooter OutrunBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign OutrunRedSign
hi! link ALEWarningSign OutrunYellowSign
hi! link ALEInfoSign OutrunBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail OutrunAqua
hi! link DirvishArg OutrunYellow

" }}}
" Netrw: {{{

hi! link netrwDir OutrunAqua
hi! link netrwClassify OutrunAqua
hi! link netrwLink OutrunGray
hi! link netrwSymLink OutrunFg1
hi! link netrwExe OutrunYellow
hi! link netrwComment OutrunGray
hi! link netrwList OutrunBlue
hi! link netrwHelpCmd OutrunAqua
hi! link netrwCmdSep OutrunFg3
hi! link netrwVersion OutrunGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir OutrunAqua
hi! link NERDTreeDirSlash OutrunAqua

hi! link NERDTreeOpenable OutrunOrange
hi! link NERDTreeClosable OutrunOrange

hi! link NERDTreeFile OutrunFg1
hi! link NERDTreeExecFile OutrunYellow

hi! link NERDTreeUp OutrunGray
hi! link NERDTreeCWD OutrunGreen
hi! link NERDTreeHelp OutrunFg1

hi! link NERDTreeToggleOn OutrunGreen
hi! link NERDTreeToggleOff OutrunRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded OutrunGreen
hi! link diffRemoved OutrunRed
hi! link diffChanged OutrunAqua

hi! link diffFile OutrunOrange
hi! link diffNewFile OutrunYellow

hi! link diffLine OutrunBlue

" }}}
" Html: {{{

hi! link htmlTag OutrunBlue
hi! link htmlEndTag OutrunBlue

hi! link htmlTagName OutrunAquaBold
hi! link htmlArg OutrunAqua

hi! link htmlScriptTag OutrunPurple
hi! link htmlTagN OutrunFg1
hi! link htmlSpecialTagName OutrunAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar OutrunOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag OutrunBlue
hi! link xmlEndTag OutrunBlue
hi! link xmlTagName OutrunBlue
hi! link xmlEqual OutrunBlue
hi! link docbkKeyword OutrunAquaBold

hi! link xmlDocTypeDecl OutrunGray
hi! link xmlDocTypeKeyword OutrunPurple
hi! link xmlCdataStart OutrunGray
hi! link xmlCdataCdata OutrunPurple
hi! link dtdFunction OutrunGray
hi! link dtdTagName OutrunPurple

hi! link xmlAttrib OutrunAqua
hi! link xmlProcessingDelim OutrunGray
hi! link dtdParamEntityPunct OutrunGray
hi! link dtdParamEntityDPunct OutrunGray
hi! link xmlAttribPunct OutrunGray

hi! link xmlEntity OutrunOrange
hi! link xmlEntityPunct OutrunOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation OutrunOrange
hi! link vimBracket OutrunOrange
hi! link vimMapModKey OutrunOrange
hi! link vimFuncSID OutrunFg3
hi! link vimSetSep OutrunFg3
hi! link vimSep OutrunFg3
hi! link vimContinue OutrunFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword OutrunBlue
hi! link clojureCond OutrunOrange
hi! link clojureSpecial OutrunOrange
hi! link clojureDefine OutrunOrange

hi! link clojureFunc OutrunYellow
hi! link clojureRepeat OutrunYellow
hi! link clojureCharacter OutrunAqua
hi! link clojureStringEscape OutrunAqua
hi! link clojureException OutrunRed

hi! link clojureRegexp OutrunAqua
hi! link clojureRegexpEscape OutrunAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen OutrunFg3
hi! link clojureAnonArg OutrunYellow
hi! link clojureVariable OutrunBlue
hi! link clojureMacro OutrunOrange

hi! link clojureMeta OutrunYellow
hi! link clojureDeref OutrunYellow
hi! link clojureQuote OutrunYellow
hi! link clojureUnquote OutrunYellow

" }}}
" C: {{{

hi! link cOperator OutrunPurple
hi! link cStructure OutrunOrange

" }}}
" Python: {{{

hi! link pythonBuiltin OutrunOrange
hi! link pythonBuiltinObj OutrunOrange
hi! link pythonBuiltinFunc OutrunOrange
hi! link pythonFunction OutrunAqua
hi! link pythonDecorator OutrunRed
hi! link pythonInclude OutrunBlue
hi! link pythonImport OutrunBlue
hi! link pythonRun OutrunBlue
hi! link pythonCoding OutrunBlue
hi! link pythonOperator OutrunRed
hi! link pythonException OutrunRed
hi! link pythonExceptions OutrunPurple
hi! link pythonBoolean OutrunPurple
hi! link pythonDot OutrunFg3
hi! link pythonConditional OutrunRed
hi! link pythonRepeat OutrunRed
hi! link pythonDottedName OutrunGreenBold

" }}}
" CSS: {{{

hi! link cssBraces OutrunBlue
hi! link cssFunctionName OutrunYellow
hi! link cssIdentifier OutrunOrange
hi! link cssClassName OutrunGreen
hi! link cssColor OutrunBlue
hi! link cssSelectorOp OutrunBlue
hi! link cssSelectorOp2 OutrunBlue
hi! link cssImportant OutrunGreen
hi! link cssVendor OutrunFg1

hi! link cssTextProp OutrunAqua
hi! link cssAnimationProp OutrunAqua
hi! link cssUIProp OutrunYellow
hi! link cssTransformProp OutrunAqua
hi! link cssTransitionProp OutrunAqua
hi! link cssPrintProp OutrunAqua
hi! link cssPositioningProp OutrunYellow
hi! link cssBoxProp OutrunAqua
hi! link cssFontDescriptorProp OutrunAqua
hi! link cssFlexibleBoxProp OutrunAqua
hi! link cssBorderOutlineProp OutrunAqua
hi! link cssBackgroundProp OutrunAqua
hi! link cssMarginProp OutrunAqua
hi! link cssListProp OutrunAqua
hi! link cssTableProp OutrunAqua
hi! link cssFontProp OutrunAqua
hi! link cssPaddingProp OutrunAqua
hi! link cssDimensionProp OutrunAqua
hi! link cssRenderProp OutrunAqua
hi! link cssColorProp OutrunAqua
hi! link cssGeneratedContentProp OutrunAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces OutrunFg1
hi! link javaScriptFunction OutrunAqua
hi! link javaScriptIdentifier OutrunRed
hi! link javaScriptMember OutrunBlue
hi! link javaScriptNumber OutrunPurple
hi! link javaScriptNull OutrunPurple
hi! link javaScriptParens OutrunFg3

" }}}
" YAJS: {{{

hi! link javascriptImport OutrunAqua
hi! link javascriptExport OutrunAqua
hi! link javascriptClassKeyword OutrunAqua
hi! link javascriptClassExtends OutrunAqua
hi! link javascriptDefault OutrunAqua

hi! link javascriptClassName OutrunYellow
hi! link javascriptClassSuperName OutrunYellow
hi! link javascriptGlobal OutrunYellow

hi! link javascriptEndColons OutrunFg1
hi! link javascriptFuncArg OutrunFg1
hi! link javascriptGlobalMethod OutrunFg1
hi! link javascriptNodeGlobal OutrunFg1
hi! link javascriptBOMWindowProp OutrunFg1
hi! link javascriptArrayMethod OutrunFg1
hi! link javascriptArrayStaticMethod OutrunFg1
hi! link javascriptCacheMethod OutrunFg1
hi! link javascriptDateMethod OutrunFg1
hi! link javascriptMathStaticMethod OutrunFg1

" hi! link javascriptProp OutrunFg1
hi! link javascriptURLUtilsProp OutrunFg1
hi! link javascriptBOMNavigatorProp OutrunFg1
hi! link javascriptDOMDocMethod OutrunFg1
hi! link javascriptDOMDocProp OutrunFg1
hi! link javascriptBOMLocationMethod OutrunFg1
hi! link javascriptBOMWindowMethod OutrunFg1
hi! link javascriptStringMethod OutrunFg1

hi! link javascriptVariable OutrunOrange
" hi! link javascriptVariable OutrunRed
" hi! link javascriptIdentifier OutrunOrange
" hi! link javascriptClassSuper OutrunOrange
hi! link javascriptIdentifier OutrunOrange
hi! link javascriptClassSuper OutrunOrange

" hi! link javascriptFuncKeyword OutrunOrange
" hi! link javascriptAsyncFunc OutrunOrange
hi! link javascriptFuncKeyword OutrunAqua
hi! link javascriptAsyncFunc OutrunAqua
hi! link javascriptClassStatic OutrunOrange

hi! link javascriptOperator OutrunRed
hi! link javascriptForOperator OutrunRed
hi! link javascriptYield OutrunRed
hi! link javascriptExceptions OutrunRed
hi! link javascriptMessage OutrunRed

hi! link javascriptTemplateSB OutrunAqua
hi! link javascriptTemplateSubstitution OutrunFg1

" hi! link javascriptLabel OutrunBlue
" hi! link javascriptObjectLabel OutrunBlue
" hi! link javascriptPropertyName OutrunBlue
hi! link javascriptLabel OutrunFg1
hi! link javascriptObjectLabel OutrunFg1
hi! link javascriptPropertyName OutrunFg1

hi! link javascriptLogicSymbols OutrunFg1
hi! link javascriptArrowFunc OutrunYellow

hi! link javascriptDocParamName OutrunFg4
hi! link javascriptDocTags OutrunFg4
hi! link javascriptDocNotation OutrunFg4
hi! link javascriptDocParamType OutrunFg4
hi! link javascriptDocNamedParamType OutrunFg4

hi! link javascriptBrackets OutrunFg1
hi! link javascriptDOMElemAttrs OutrunFg1
hi! link javascriptDOMEventMethod OutrunFg1
hi! link javascriptDOMNodeMethod OutrunFg1
hi! link javascriptDOMStorageMethod OutrunFg1
hi! link javascriptHeadersMethod OutrunFg1

hi! link javascriptAsyncFuncKeyword OutrunRed
hi! link javascriptAwaitFuncKeyword OutrunRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword OutrunAqua
hi! link jsExtendsKeyword OutrunAqua
hi! link jsExportDefault OutrunAqua
hi! link jsTemplateBraces OutrunAqua
hi! link jsGlobalNodeObjects OutrunFg1
hi! link jsGlobalObjects OutrunFg1
hi! link jsFunction OutrunAqua
hi! link jsFuncParens OutrunFg3
hi! link jsParens OutrunFg3
hi! link jsNull OutrunPurple
hi! link jsUndefined OutrunPurple
hi! link jsClassDefinition OutrunYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved OutrunAqua
hi! link typeScriptLabel OutrunAqua
hi! link typeScriptFuncKeyword OutrunAqua
hi! link typeScriptIdentifier OutrunOrange
hi! link typeScriptBraces OutrunFg1
hi! link typeScriptEndColons OutrunFg1
hi! link typeScriptDOMObjects OutrunFg1
hi! link typeScriptAjaxMethods OutrunFg1
hi! link typeScriptLogicSymbols OutrunFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects OutrunFg1
hi! link typeScriptParens OutrunFg3
hi! link typeScriptOpSymbols OutrunFg3
hi! link typeScriptHtmlElemProperties OutrunFg1
hi! link typeScriptNull OutrunPurple
hi! link typeScriptInterpolationDelimiter OutrunAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword OutrunAqua
hi! link purescriptModuleName OutrunFg1
hi! link purescriptWhere OutrunAqua
hi! link purescriptDelimiter OutrunFg4
hi! link purescriptType OutrunFg1
hi! link purescriptImportKeyword OutrunAqua
hi! link purescriptHidingKeyword OutrunAqua
hi! link purescriptAsKeyword OutrunAqua
hi! link purescriptStructure OutrunAqua
hi! link purescriptOperator OutrunBlue

hi! link purescriptTypeVar OutrunFg1
hi! link purescriptConstructor OutrunFg1
hi! link purescriptFunction OutrunFg1
hi! link purescriptConditional OutrunOrange
hi! link purescriptBacktick OutrunOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp OutrunFg3
hi! link coffeeSpecialOp OutrunFg3
hi! link coffeeCurly OutrunOrange
hi! link coffeeParen OutrunFg3
hi! link coffeeBracket OutrunOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter OutrunGreen
hi! link rubyInterpolationDelimiter OutrunAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier OutrunRed
hi! link objcDirective OutrunBlue

" }}}
" Go: {{{

hi! link goDirective OutrunAqua
hi! link goConstants OutrunPurple
hi! link goDeclaration OutrunRed
hi! link goDeclType OutrunBlue
hi! link goBuiltins OutrunOrange

" }}}
" Lua: {{{

hi! link luaIn OutrunRed
hi! link luaFunction OutrunAqua
hi! link luaTable OutrunOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp OutrunFg3
hi! link moonExtendedOp OutrunFg3
hi! link moonFunction OutrunFg3
hi! link moonObject OutrunYellow

" }}}
" Java: {{{

hi! link javaAnnotation OutrunBlue
hi! link javaDocTags OutrunAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen OutrunFg3
hi! link javaParen1 OutrunFg3
hi! link javaParen2 OutrunFg3
hi! link javaParen3 OutrunFg3
hi! link javaParen4 OutrunFg3
hi! link javaParen5 OutrunFg3
hi! link javaOperator OutrunOrange

hi! link javaVarArg OutrunGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter OutrunGreen
hi! link elixirInterpolationDelimiter OutrunAqua

hi! link elixirModuleDeclaration OutrunYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition OutrunFg1
hi! link scalaCaseFollowing OutrunFg1
hi! link scalaCapitalWord OutrunFg1
hi! link scalaTypeExtension OutrunFg1

hi! link scalaKeyword OutrunRed
hi! link scalaKeywordModifier OutrunRed

hi! link scalaSpecial OutrunAqua
hi! link scalaOperator OutrunFg1

hi! link scalaTypeDeclaration OutrunYellow
hi! link scalaTypeTypePostDeclaration OutrunYellow

hi! link scalaInstanceDeclaration OutrunFg1
hi! link scalaInterpolation OutrunAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 OutrunGreenBold
hi! link markdownH2 OutrunGreenBold
hi! link markdownH3 OutrunYellowBold
hi! link markdownH4 OutrunYellowBold
hi! link markdownH5 OutrunYellow
hi! link markdownH6 OutrunYellow

hi! link markdownCode OutrunAqua
hi! link markdownCodeBlock OutrunAqua
hi! link markdownCodeDelimiter OutrunAqua

hi! link markdownBlockquote OutrunGray
hi! link markdownListMarker OutrunGray
hi! link markdownOrderedListMarker OutrunGray
hi! link markdownRule OutrunGray
hi! link markdownHeadingRule OutrunGray

hi! link markdownUrlDelimiter OutrunFg3
hi! link markdownLinkDelimiter OutrunFg3
hi! link markdownLinkTextDelimiter OutrunFg3

hi! link markdownHeadingDelimiter OutrunOrange
hi! link markdownUrl OutrunPurple
hi! link markdownUrlTitleDelimiter OutrunGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType OutrunYellow
" hi! link haskellOperators OutrunOrange
" hi! link haskellConditional OutrunAqua
" hi! link haskellLet OutrunOrange
"
hi! link haskellType OutrunFg1
hi! link haskellIdentifier OutrunFg1
hi! link haskellSeparator OutrunFg1
hi! link haskellDelimiter OutrunFg4
hi! link haskellOperators OutrunBlue
"
hi! link haskellBacktick OutrunOrange
hi! link haskellStatement OutrunOrange
hi! link haskellConditional OutrunOrange

hi! link haskellLet OutrunAqua
hi! link haskellDefault OutrunAqua
hi! link haskellWhere OutrunAqua
hi! link haskellBottom OutrunAqua
hi! link haskellBlockKeywords OutrunAqua
hi! link haskellImportKeywords OutrunAqua
hi! link haskellDeclKeyword OutrunAqua
hi! link haskellDeriving OutrunAqua
hi! link haskellAssocType OutrunAqua

hi! link haskellNumber OutrunPurple
hi! link haskellPragma OutrunPurple

hi! link haskellString OutrunGreen
hi! link haskellChar OutrunGreen

" }}}
" Json: {{{

hi! link jsonKeyword OutrunGreen
hi! link jsonQuote OutrunGreen
hi! link jsonBraces OutrunFg1
hi! link jsonString OutrunFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! OutrunHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! OutrunHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
