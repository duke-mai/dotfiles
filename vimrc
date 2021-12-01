""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load the documentation for all the plugins:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packloadall          " Load all plugins.
silent! helptags ALL " Load help for all plugins.


" GUI RELATED ------------------------------------------------------------ {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set font according to system
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable scrollbars (real hackers don't use scrollbars for navigation!)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" }}}


" GENERAL CONFIGURATION OPTIONS ------------------------------------------ {{{

" Use Vim settings, rather then Vi settings. It’s important to have this
" on the top of your file, as it influences other options.
set nocompatible

" Allow backspacing over indention, line breaks and insertion start.
set backspace=indent,eol,start

set history=1000 " Set bigger history of executed commands.

set showcmd      " Show incomplete commands at the bottom.

set showmode     " Show current mode at the bottom.

" Automatically re-read files if unmodified inside Vim.
set autoread

" Manage multiple buffers effectively: the current buffer can be “sent” to
" the background without writing to disk. When a background buffer become
" current again, marks and undo-history are remembered.
" See chapter Buffers to understand this better.
set hidden

let mapleader="\<Space>"	" Map the leader key to a spacebar.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2               " Always display the status bar.

set ruler                      " Always show cursor position.

" Maximum number of tab pages that can be opened from the command line.
set tabpagemax=40

set noerrorbells               " Disable beep on errors.

set visualbell                 " Flash screen instead of beeping on errors.

set mouse=a                    " Enable mouse for scrolling and resizing.

" Set the window’s title, reflecting the file currently being edited.
set title


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Wildmenu completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                   " Enable auto completion menu after <TAB>.
set wildmode=longest,list,full " Make wildmenu behave akin to Bash completion.

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc,*.log,*.idx    " LaTeX intermediate files
set wildignore+=*_aux,*.glg,*.glo,*.gls,*.ist    " LaTeX intermediate files
set wildignore+=*.nlo,*.nls,*.pdf,*.bbl,*.dvi    " still LaTeX intermediate files
set wildignore+=*.ilg,*.fdb_latexmk,*.synctex.gz " $(B!D(B LaTeX intermediate files
set wildignore+=*.blg,*.ind                      " $(B!D!D!D(B LaTeX intermediate files
set wildignore+=*.hi                             " Haskell linker files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" Better Completion
set completeopt=longest,menuone,preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Clipboard / Registers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow copied vim text to also be added to clipboard
set clipboard=unnamed,unnamedplus


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cursor line / column
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
set cursorcolumn
"highlight CursorLine guibg=#2b2b2b
"highlight CursorColumn guibg=#2b2b2b


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => (Relative) Number Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers on the sidebar.
set number

" Show line number on the current line and relative numbers on other lines.
" Works only if the option above ( number ) is enabled.
set relativenumber


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splitting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent     " New lines inherit the indentation of previous lines.

filetype on        " Enable type file detection.

filetype plugin on " Enable and load plugin for the detected file type.

filetype indent on " Load an indent file for the detected file type.

set tabstop=4      " Show existing tab with 4 spaces width.

set shiftwidth=4   " When indenting with ‘>’, use 4 spaces width.

set expandtab      " Use space characters instead of tabs.

set wrap           " Wrap lines.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch    " Find the next match as we type the search.

set hlsearch     " Highlight searches by default.

set smartcase    " . . . unless you type a capital.

set showmatch    " Show matching words during a search.

set noignorecase " Do not ignore capital letters during search.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text rendering options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8  " Use an encoding that supports Unicode.

" Wrap lines at convenient points.
" Avoid wrapping a line in the middle of a word.
set linebreak

" The number of screen lines to keep above and below the cursor.
set scrolloff=3

" The number of screen columns to keep to the left and right of the cursor.
set sidescrolloff=5


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display a confirmation dialogue when closing an unsaved file.
set confirm

" Ignore files mode lines; use vimrc configurations instead.
set nomodeline

set nrformats-=octal " Interpret octal as decimal when incrementing numbers.

" set shell            " The shell used to execute commands.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set up persistent undo across all files.
"    means that you can undo even when you close a buffer/VIM.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/tmp/undo//     " undo files
    set undofile
    set undoreload=10000
catch
endtry

" Create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/tmp/undo"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
    call mkdir(targetdir, "p", 0700)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backup and swap file options - disable all of them:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set backupdir=~/.vim/tmp/backup// " backups
" " Create undodir directory if possible and does not exist yet
" let targetdir=$HOME . "/.vim/tmp/backup"
" if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
"     call mkdir(targetdir, "p", 0700)
" endif

" set directory=~/.vim/tmp/swap//   " swap files
" " Create undodir directory if possible and does not exist yet
" let targetdir=$HOME . "/.vim/tmp/swap"
" if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
"     call mkdir(targetdir, "p", 0700)
" endif

set nowritebackup    " only in case you don't want a backup file while editing
set backup           " Enable backups
set noswapfile       " It's 2012, Vim.
set makeef=error.err " When using make, where should it dump the file
set nowb

                            " *backup-table*
" 'backup' 'writebackup'  action
   " off       off    no backup made
   " off       on     backup current file, deleted afterwards (default)
   " on        off    delete old backup, backup current file
   " on        on     delete old backup, backup current file

" }}}


" PLUGINS ---------------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press {Leader n} to access NERDTree plugin.
nnoremap <Leader>n  : NERDTreeToggle<Cr>

" au VimEnter * NERDTree     " Enable NERDTree on Vim start-up.

" Autoclose NERDTree if it's the only open window left.
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
\ b:NERDTree.isTabTree()) | q | endif

" Have nerdtree show hidden files, but ignore certain files and directories.
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\~$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

" Src: https://gist.github.com/ted-juan/4231826#file-vimrc-L949
au Filetype nerdtree setl nolist

let NERDTreeCaseSensitiveSort = 1
let NERDTreeNaturalSort       = 1
let NERDTreeSortHiddenFirst   = 1
let NERDTreeChDirMode         = 3
let NERDTreeRespectWildIgnore = 1
let NERDTreeQuitOnOpen        = 1
let NERDTreeWinPos            = "right"
let NERDTreeWinSize           = 20
let NERDTreeMinimalUI         = 1
let NERDTreeDirArrows         = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType vim nnoremap gcc I"<Space><Esc>0
" au FileType vim vnoremap gc I"<Space><Esc>0

" au FileType vim nnoremap guc 0xx<Esc>
" au FileType vim vnoremap guc 0xx<Esc>

" au FileType python nnoremap gcc I#<Space><Esc>0
" au FileType python vnoremap gc I#<Space><Esc>0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change <tab> navigate the completion menu from bottom to top
let g:SuperTabDefaultCompletionType = "<C-N>"

" Enhanced longest match support
let g:SuperTabLongestEnhanced       = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-unimpaired
"    I mapped it myself
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line operations
nnoremap [ns      i<Space> <Esc> " Add [count] blank spaces before the cursor
nnoremap ]ns      a<Space> <Esc> " Add [count] blank spaces after the cursor

nnoremap [<Space> O        <Esc> " Add [count] blank lines above the cursor
nnoremap ]<Space> o        <Esc> " Add [count] blank lines below the cursor

" Toggle background colour
if exists("*ToggleBackground") == 0
	function ToggleBackground()
		if &background == "dark"
			set background=light
		else
			set background=dark
		endif
	endfunction
	command BG call ToggleBackground()
endif

nnoremap yob :BG<Cr>
au FileType * nnoremap [ob :set background=light                  <Cr>
au FileType * nnoremap ]ob :set background=dark                   <Cr>

" Toggle cursorline
au FileType * nnoremap [oc :set cursorline                        <Cr>
au FileType * nnoremap ]oc :set nocursorline                      <Cr>

" Toggle spell
nnoremap yoe :set spell!                                          <Cr>
au FileType * nnoremap [oe :set spell                             <Cr>
au FileType * nnoremap ]oe :set nospell                           <Cr>

" Toggle highlight search
au FileType * nnoremap [oh :set hlsearch                          <Cr>
au FileType * nnoremap ]oh :set nohlsearch                        <Cr>

" Toggle highlight search
au FileType * nnoremap [oi :set ignore                            <Cr>
au FileType * nnoremap ]oi :set noignorecase                      <Cr>

" Toggle list
au FileType * nnoremap [ol :set list                              <Cr>
au FileType * nnoremap ]ol :set nolist                            <Cr>

" Toggle number
au FileType * nnoremap [on :set number                            <Cr>
au FileType * nnoremap ]on :set nonumber                          <Cr>

" Toggle relativenumber
au FileType * nnoremap [on :set relativenumber                    <Cr>
au FileType * nnoremap ]on :set norelativenumber                  <Cr>

" Toggle cursorcolumn
au FileType * nnoremap [on :set cursorcolumn                      <Cr>
au FileType * nnoremap ]on :set nocursorcolumn                    <Cr>

" Toggle wrap
au FileType * nnoremap [ow :set wrap                              <Cr>
au FileType * nnoremap ]ow :set nowrap                            <Cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Bslash>f{char} to move to {char}
map  <Bslash>f <Plug>                       (easymotion-bd-f)
nmap <Bslash>f <Plug>                       (easymotion-overwin-f)

" <Bslash><Bslash>f to move to {char}{char}
nmap <Bslash>F <Plug>                       (easymotion-overwin-f2)

" Move to line
map  <Bslash>L <Plug>                       (easymotion-bd-jk)
nmap <Bslash>L <Plug>                       (easymotion-overwin-line)

" Move to word
map  <Bslash>w <Plug>                       (easymotion-bd-w)
nmap <Bslash>w <Plug>                       (easymotion-overwin-w)

" hjkl motions: Line and Column motions
map <Bslash>l <Plug>                        (easymotion-lineforward)
map <Bslash>j <Plug>                        (easymotion-j)
map <Bslash>k <Plug>                        (easymotion-k)
map <Bslash>h <Plug>                        (easymotion-linebackward)

" Keep cursor column when JK motion
let g:EasyMotion_startofline = 0

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" n-character search motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff maps
map <F3> :Gvdiffsplit<Cr> " Apply Git diff split vertically
map <F4> :Gdiffsplit<Cr>  " ... split horizontally

nnoremap <leader>gd  : Gdiff<Cr>
nnoremap <leader>gs  : Gstatus<Cr>
nnoremap <leader>gw  : Gwrite<Cr>
nnoremap <leader>ga  : Gadd<Cr>
nnoremap <leader>gb  : Gblame<Cr>
nnoremap <leader>gco : Gcheckout<Cr>
nnoremap <leader>gci : Gcommit<Cr>
nnoremap <leader>gm  : Gmove<Cr>
nnoremap <leader>gr  : Gremove<Cr>
nnoremap <leader>gl  : Shell git gl -18<Cr> : wincmd \|<Cr>

augroup ft_fugitive
    au!
    au BufNewFile,BufRead .git/index setl nolist
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
" Disable all predefined mappings
let g:gitgutter_map_keys=0

" Update time controls the delay before vim writes its swap file
set updatetime=100

" Jump between hunks (differing lines)
nnoremap ) :GitGutterNextHunk
nnoremap ( :GitGtterPrevHunk

" Turn line highlighting on
" nnoremap <F6> :GitGutterLineHighlightsToggle<Cr>

" Fold all unchanged lines, leaving just the hunks visible.
nnoremap <F2> :GitGutterFold<Cr>
set foldtext=gitgutter#fold#foldtext()

" Sign column
" set signcolumn=yes
" highlight SignColumn guibg=yellow ctermbg=yellow

" Signs' colours and symbols
" let g:gitgutter_set_sign_backgrounds=1
highlight GitGutterAdd    guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red

let g:gitgutter_sign_added                   = 'xx'
let g:gitgutter_sign_modified                = 'yy'
let g:gitgutter_sign_removed                 = 'zz'
let g:gitgutter_sign_removed_first_line      = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed        = 'ww'

" Preview the hunk the cursor is in
nnoremap ghp :GitGutterPreviewHunk<Cr>
nnoremap ghq :pclose<Cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-floaterm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
let g:floaterm_gitcommit  = 'floaterm'
let g:floaterm_autoinsert = 1
let g:floaterm_width      = 0.8
let g:floaterm_height     = 0.8
let g:floaterm_wintitle   = 0
let g:floaterm_autoclose  = 1

" Mapping
nnoremap   <silent>   <F6>    :FloatermNew<CR>
tnoremap   <silent>   <F6>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F7>    :FloatermPrev<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F8>    :FloatermNext<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F9>    :FloatermKill<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermKill<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

" Highlight
" Set floaterm window's background to black
highlight Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
highlight FloatermBorder guibg=orange guifg=cyan


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabular
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap :T :Tabularize /

" Tabularize used in vimrc's comments.
vnoremap :T" :Tabularize /"<Cr>

" Tabularize used for multiple assignments.
vnoremap :T= :Tabularize /=<Cr>

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Save/quit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <C-S> :w<Cr>	        " Press {Ctrl S} instead of {:w Cr}

" nnoremap <Leader>wq :wq<Cr>	  " Press {Leader wq} instead of {:wq Cr}

nnoremap <Leader>q :q<Cr>	    " Press {Leader q} instead of {:q Cr}

" inoremap <C-C> <Esc>          " Press {Ctrl C} to escape from Insert mode

" Quickreturn
" inoremap <c-cr> <esc>A<cr>
" inoremap <s-cr> <esc>A:<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make 'Y', 'D', 'C' make sense
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Y yy
nnoremap D dd
nnoremap C cc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set foldmethod=indent		" Folding code based on indentation.

nnoremap za zA       " Press {za} to open/close all folding levels.
vnoremap za zA
nnoremap zo zR       " Press {zo} to open every fold.
vnoremap zo zR
nnoremap zc zM       " Press {zc} to close every fold.
vnoremap zc zM

set foldlevelstart=0 " Start editing with all folds closed
" set foldlevel=5

function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '$(B!D(B' . repeat(" ",fillcharcount) . foldedlinecount . '$(B!D(B' . ' '
endfunction
set foldtext=MyFoldText()

highlight Folded guibg=Gray8 guifg=Gray ctermbg=235  ctermfg=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Immediately add a closing quotes/braces in Insert mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap < <><Esc>i

" Unmap closing double quotes for vim filetype (comments).
au FileType vim unmap! "


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colon shortcuts to access command line mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ; :
vnoremap ; :
nnoremap : :!


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast split navigation with <Ctrl> + hjkl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" 2. Terminal mode
tnoremap <C-H> <C-W><C-H>
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><
" 2. Terminal mode
tnoremap <c-up> <c-w>+
tnoremap <c-down> <c-w>-
tnoremap <c-left> <c-w>>
tnoremap <c-right> <c-w><


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Move the current window to the corresponding position.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Normal mode
nnoremap <C-W>h <C-W>H
nnoremap <C-W>j <C-W>J
nnoremap <C-W>k <C-W>K
nnoremap <C-W>l <C-W>L
" 2. Terminal mode
tnoremap <C-W>h <C-W>H
tnoremap <C-W>j <C-W>J
tnoremap <C-W>k <C-W>K
tnoremap <C-W>l <C-W>L


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Map arrow keys nothing so I can get used to hjkl-style movement.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" Insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autosave everytime a change is made.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au TextChanged * if &readonly==0 && filereadable(bufname('%'))|silent up|endif
au TextChanged * :w


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Resize splits when the window is resized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au VimResized * exe "normal! \<c-w>="


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line Return
"    Make sure Vim returns to the same line when you reopen a file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Press <Space>p to print the current file to the default printer
"    from a Linux operating system.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
" nnoremap <silent> <leader>p :%w !lp<CR>

" }}}


" VIM SCRIPTS ------------------------------------------------------------ {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map the F5 key to run a Python script inside Vim.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype python nnoremap <F5> :w<CR>:!clear<CR><CR><CR>:!python3 %<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell check
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable spell checking on start-up
set spell spelllang=en_au

" Highlight spelling mistakes
" badly spelled word
highlight SpellBad    term=reverse   ctermbg=12 gui=undercurl guisp=Red
" word with wrong caps
highlight SpellCap    term=reverse   ctermbg=9  gui=undercurl guisp=Blue
" rare word
highlight SpellRare   term=reverse   ctermbg=13 gui=undercurl guisp=Magenta
" word only exists in other region
highlight SpellLocale term=underline ctermbg=11 gui=undercurl guisp=DarkCyan

" Ignore CamelCase words when spell checking
fun! IgnoreSpell()
    syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
    syn cluster Spell add=CamelCase
    syntax match InlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/ contains=@NoSpell transparent
    syn cluster Spell add=InlineURL
endfun
au BufRead,BufNewFile * :call IgnoreSpell()

" Enable nospell by default for some filetype
au FileType * setl nospell


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable making changes to file (plugins)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup readonly
  au!
  au BufEnter ~/.vim/pack/* setl nomodifiable
augroup END

" Disable colorcolumn if the buffer is read only
function CheckRo()
    if &readonly
        set colorcolumn=0
    endif
endfunction
au BufReadPost * call CheckRo()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable relative numbers in Normal mode; absolute numbers in Insert mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup toggle_relative_number
  au!
  au InsertEnter * setl norelativenumber
  au InsertLeave * setl relativenumber
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically centre the current line when I enter it in Insert mode.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au InsertEnter * norm zz


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable the marker method of folding.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType vim setl foldmethod=marker


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => If the current file type is HTML, set indentation to 2 spaces.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype html,vim,vimwiki setl tabstop=2 shiftwidth=2 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Make the 80th column stand out (PEP 8 Style Guide for Python Code)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set termguicolors
" set t_Co=256
"highlight Folded guibg=black
highlight ColorColumn guibg=Gray15 ctermbg=235
call matchadd('ColorColumn', '\%80v', 100)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hightlight matches when jumping to next:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> n     n:call HLNext(0.4)<Cr>
nnoremap <silent> N     N:call HLNext(0.4)<Cr>

function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

" function! HLNext (blinktime)
"     let [bufnum, lnum, col, off]=getpos('.')
"     let matchlen=strlen(matchstr(strpart(getline('.'),col-1),@/))
"     let target_pat='\c\%#'.@/
"     let blinks=3
"     for n in range(1,blinks)
"         let red=matchadd('WhiteOnRed', target_pat, 101)
"         redraw
"         exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
"         call matchdelete(red)
"         redraw
"         exec 'sleep ' . float2nr(a:blinktime / (2*blinks) * 1000) . 'm'
"     endfor
" endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable automatic commenting on newline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType * setl formatoptions-=c formatoptions-=r formatoptions-=o


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Highlight white space and tab characters.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight WhitespaceEOL term=standout ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

call matchadd('WhitespaceEOL', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')

"highlight ColorColumn guibg=Gray15 ctermbg=235
highlight CursorLine guibg=Gray23 ctermbg=235

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Automatically remove trailing whitespace after saving.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
match ErrorMsg '\s\+$'        " Highlight trailing whitespace
au BufWritePre * :%s/\s\+$//e " Automatically remove trailing whitespace


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colour scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

if has("gui_running")
    "set background=light        " we are not using a dark background
    "set background=dark         " we are not using a light background
    colorscheme xoria256
    if (hostname() == 'wollnashorn')
        set guifont=DejaVu\ Sans\ Mono\ 12
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    highlight Cursor guifg=black guibg=DarkOrange
    highlight iCursor guifg=black guibg=Green
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait0
    cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'bd' : 'x'
    cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'bd' : 'q'
else
    set t_Co=256
    "set background=light       " we are not using a light background
    "set background=dark        " we are not using a light background
    colorscheme xoria256
    "au InsertEnter * highlight  CursorLine ctermbg=23 ctermfg=None
    " Revert Color to default when leaving Insert Mode
    "au InsertLeave * highlight  CursorLine ctermbg=237 ctermfg=None
endif

if &term =~ "xterm\\|rxvt"
    " use an orange cursor in insert mode
    let &t_SI = "\<Esc>]12;green\x7"
    " use a red cursor otherwise
    let &t_EI = "\<Esc>]12;orange\x7"
    silent !echo -ne "\033]12;orange\007"
    " reset cursor when vim exits
    au VimLeave * silent !echo -ne "\033]12;white\007"
    " use \003]12;gray\007 for gnome-terminal
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Change theme depending on the time of day
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme gruvbox      	     " Change colourscheme

let hr=(strftime('%H'))

if hr >= 22
  set background=dark
elseif hr >= 8
  set background=light
elseif hr>= 0
  set background=dark
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim/vimrc<cr>
au! bufwritepost ~/.vim/vimrc source ~/.vim/vimrc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Block Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:blockcolor_state = 0
function! BlockColor() " {{{
    if g:blockcolor_state
        let g:blockcolor_state = 0
        call matchdelete(77880)
        call matchdelete(77881)
        call matchdelete(77882)
        call matchdelete(77883)
    else
        let g:blockcolor_state = 1
        call matchadd("BlockColor1", '^ \{4}.*', 1, 77880)
        call matchadd("BlockColor2", '^ \{8}.*', 2, 77881)
        call matchadd("BlockColor3", '^ \{12}.*', 3, 77882)
        call matchadd("BlockColor4", '^ \{16}.*', 4, 77883)
    endif
endfunction " }}}
nnoremap <leader>B :call BlockColor()<cr>

" }}}


" STATUS LINE ------------------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=

" Color statusline
set statusline+=%#PmenuSel#

" Get a list of counts of added, modified, and removed lines (current buffer)
function! GitStatus()
  let [a,m,r]=GitGutterGetHunkSummary()
  return printf('+%d  ~%d  -%d', a, m, r)
endfunction
set statusline+=\\|\ %{GitStatus()}\ \|

" Status line left side.
set statusline+=\ %f\ \|\ %M
set statusline+=\ %Y\ %R\ \|

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\/\%L\ \|\ col:\ %c\ \|\ percent:\ %p%%\ \|

" Show the status on the second to last line.
set laststatus=2

" }}}


" PYTHON ------------------------------------------------------------ {{{
augroup ft_python
    au!

    " au FileType python setl omnifunc=pythoncomplete#Complete
    au FileType python setl define=^\s*\\(def\\\\|class\\)
    " au FileType python compiler nose
    au FileType man nnoremap <buffer> <cr> :q<cr>

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    " Jesus, Python.  Five characters of punctuation for a damn string?
    au FileType python inoremap <buffer> <d-'> _(u'')<left><left>

augroup END

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def

" }}}
