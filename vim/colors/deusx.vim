" vim: set tw=0 sw=4 sts=4 et:

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "deusx"


""" Colors

" GUI colors
hi Cursor               guifg=black guibg=white
hi CursorIM             guifg=black guibg=white
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
hi ErrorMsg             gui=bold guifg=White guibg=Red
"hi VertSplit
"hi Folded
"hi FoldColumn
"hi IncSearch
hi LineNr               guifg=darkorange
hi ModeMsg              gui=bold
"hi MoreMsg
"hi NonText
hi Normal               guibg=black guifg=white
"hi Question
hi Search               gui=bold guifg=Black guibg=white
"hi SpecialKey
hi StatusLine           guifg=orange1
hi StatusLineNC         guifg=yellow4
"hi Title
hi Visual               guifg=gray35 guibg=fg
hi VisualNOS            gui=bold guifg=black guibg=fg
hi WarningMsg           guifg=White guibg=Tomato
"hi WildMenu

" Colors for syntax highlighting
hi Comment              guifg=red

hi Constant             gui=NONE guifg=#40f040 guibg=NONE
hi String               gui=NONE guifg=#40f040 guibg=NONE
hi Character            gui=NONE guifg=#40f040 guibg=NONE
hi Number               gui=NONE guifg=#40f040 guibg=NONE
hi Boolean              gui=NONE guifg=#40f040 guibg=NONE
hi Float                gui=NONE guifg=#40f040 guibg=NONE

hi Identifier           guifg=#22aaff
hi Function             guifg=#22aaff

hi Statement            gui=NONE guifg=#aa00ff guibg=NONE
hi Conditional          gui=NONE guifg=#aa00ff guibg=NONE
hi Repeat               gui=NONE guifg=#aa00ff guibg=NONE
hi Label                gui=NONE guifg=#aa00ff guibg=NONE
hi Operator             gui=NONE guifg=#aa00ff guibg=NONE
hi Keyword              gui=NONE guifg=#aa00ff guibg=NONE
hi Exception            gui=NONE guifg=#aa00ff guibg=NONE

hi PreProc              guifg=#dd99ff
hi Include              guifg=#dd99ff
hi Define               guifg=#dd99ff
hi Macro                guifg=#dd99ff
hi PreCondit            guifg=#dd99ff

hi Type                 guifg=yellow
    hi StorageClass     guifg=cyan1
    hi Structure         guifg=cyan1
    hi Typedef          guifg=cyan1

"hi Special
    ""Underline Character
    "hi SpecialChar      gui=underline
    "hi Tag              gui=bold,underline
    ""Statement
    "hi Delimiter        gui=bold
    ""Bold comment (in Java at least)
    "hi SpecialComment   gui=bold
    "hi Debug            gui=bold

hi Underlined           gui=underline

hi Ignore               guifg=bg

hi Error                gui=bold guifg=White guibg=Red

"hi Todo
