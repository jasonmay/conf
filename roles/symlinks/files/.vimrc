filetype off

set rtp+=$VUNDLE_RTP

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'sartak/sumi'
Plugin 'psf/black'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nanotech/jellybeans.vim'
Plugin 'posva/vim-vue'

Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

Bundle 'ervandew/supertab'
if $ON_VPS != 1
    Bundle 'Valloric/YouCompleteMe'
endif
Bundle 'davidhalter/jedi'
Bundle 'nvie/vim-flake8'
Bundle 'junegunn/fzf'
Bundle 'Glench/Vim-Jinja2-Syntax'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'vim-syntastic/syntastic'
Plugin 'integralist/vim-mypy'
Plugin 'neoclide/coc.nvim'

Bundle 'romainl/vim-qf'

Plugin 'jpalardy/vim-slime'
Plugin 'hanschen/vim-ipython-cell'

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-dispatch'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()

filetype plugin indent on

set encoding=utf8
let python_highlight_all=1
syntax on
set ruler
set nocompatible
set rulerformat=%40(%=%t%h%m%r%w%<\ (%n)\ %4.7l,%-7.(%c%V%)\ %P%)
set showmode
set showcmd
set shortmess=aotTWI
set laststatus=2
set display+=lastline,uhex
set scrolloff=3
set lazyredraw
set hlsearch
set showmatch
set matchtime=1
set report=0
set nomore
set noswapfile
set autoread
set ttyfast
set completeopt=menuone
set incsearch
set tildeop
set backspace=indent,eol,start
"set wildmenu
set wildignore+=.log,.out,.o
set viminfo=!,'1000,f1,/1000,:1000,<1000,@1000,h,n~/.viminfo
set isfname+=:
set wildmode=longest,list,full
set hidden
set vb t_vb=
set ttimeoutlen=1

set tabstop=4
set shiftwidth=4
set softtabstop=4

set shiftround
set autoindent
set smartindent

set foldenable
set foldmethod=marker

set backupskip=/tmp/*,/private/tmp/*"

let s:tmux = 1
set rtp+=~/.fzf

let workrepo=substitute(system('git config jason.workrepo'), '\n', '', '')
if workrepo=="true"
    set noexpandtab
else
	set expandtab
endif

let g:EclimCompletionMethod = 'omnifunc'

set bg=dark
let &term="xterm-256color"
silent colorscheme PaperColor

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

highlight Search NONE ctermfg=lightred
highlight Folded      ctermbg=black ctermfg=blue

autocmd BufNewFile,BufRead *.reg,*.run,repl.rc,*.repl.rc,*.psgi,*.t set ft=perl
autocmd BufNewFile,BufRead *.asl       set ft=ruby
autocmd BufNewFile,BufRead psql.edit.* set ft=sql
autocmd BufNewFile,BufRead *.tt,*.tt2  set ft=tt2html
autocmd BufNewFile,BufRead *.json      set ft=json
autocmd BufNewFile,BufRead *.p6,*.pm6  set ft=perl6
autocmd BufNewFile,BufRead *.scpt      set ft=applescript
autocmd BufNewFile,BufRead Xdefaults   set ft=Xdefaults
autocmd BufNewFile,BufRead share/html/* set ft=mason
autocmd BufNewFile,BufRead etc/upgrade/*/content set ft=perl
autocmd BufNewFile,BufRead *.md      set ft=markdown
autocmd BufNewFile,BufRead *.vue      set ft=vue
autocmd BufNewFile,BufRead Vagrantfile set ft=ruby
autocmd BufNewFile,BufRead *.txt      set ft=text

autocmd FileType ruby,eruby,html,haml,vue,yaml,c set ts=2 sw=2 sts=2
autocmd FileType java set ts=3 sw=3 sts=3
autocmd FileType javascript,perl,python set ts=4 sw=4 sts=4

autocmd FileType           perl setlocal makeprg=$VIMRUNTIME/tools/efm_perl.pl\ -c\ %\ $*
autocmd FileType           perl setlocal errorformat=%f:%l:%m

autocmd FileType php setlocal keywordprg=/Users/jason/pear/bin/pman

" autocmd BufWritePre *.py Black

" Automatic commands
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
hi EOLWS ctermbg=red


autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>

function! <SID>BackToLastPosition()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal g`\""
  endif
endfunction
autocmd BufReadPost * call <SID>BackToLastPosition()

" Mappings

inoremap <silent> <C-a> <ESC>u:set paste<CR>.:set nopaste<CR>gi

nmap     Y          y$

nmap     <Right>    :bn<CR>
nmap     <Left>     :bp<CR>

imap     <Right>    <C-o>:bn<CR>
imap     <Left>     <C-o>:bp<CR>

let g:jason_lefthand = 0

function SetHand()
  if g:jason_lefthand == 1
    nnoremap t h
    nnoremap h k
    nnoremap e j
    nnoremap a l
    vnoremap t h
    vnoremap h k
    vnoremap e j
    vnoremap a l
  
    nnoremap s x
  
    nmap     T          ^
    vmap     T          ^
    nmap     E          $
    vmap     E          $
  else
    silent! nunmap t
    silent! nunmap h
    silent! nunmap e
    silent! nunmap a
    silent! vunmap t
    silent! vunmap h
    silent! vunmap e
    silent! vunmap a
    silent! nunmap s
    nmap     H          ^
    vmap     H          ^
    nmap     L          $
    vmap     L          $
  endif
endfunction

if $LEFTHAND == 1
    let g:jason_lefthand = 1
else
    let g:jason_lefthand = 0
endif

call SetHand()


function ToggleHand()
    let g:jason_lefthand = !g:jason_lefthand
    call SetHand()
endfunction

nnoremap <leader>n :call ToggleHand()<cr>

nmap     M          :nohl<CR>:syn on<CR>:syntax sync fromstart<CR>:set background=dark<CR><C-k>

nmap     <Left>     :bn<CR>
nmap     <Right>    :bp<CR>

nmap     <CR>       o<Esc>
nmap     <F1>       <Esc>
inoremap <F1>       <Esc>

inoremap <c-j> <esc>j
inoremap <c-k> <esc>k

nnoremap -          <Space>

map      <Leader>p :set paste<CR>:r!pbpaste<CR>:set nopaste<CR>

nmap <C-n> :silent cnext<CR>
nmap <C-p> :silent cprev<CR>

nmap      <Leader>,t :!for s in $(seq 1 15); do echo; done;sbt test<cr>
nmap      <Leader>,r :!for s in $(seq 1 15); do echo; done;sbt run<cr>
nmap      <Leader>,c :!for s in $(seq 1 15); do echo; done;sbt compile<cr>

iabbrev reponse    response
iabbrev shfit      shift
iabbrev sfhit      shift

nnor yH y^
nnor yL y$

"""" FUNCTIONS

function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

set wildignore+=*.o,*.obj,.git,*.class,*.jar,*.zip,node_modules/**

nnoremap <leader>t :FZF<cr>

hi link coffeeSpaceError NONE

highlight Normal ctermfg=grey ctermbg=black

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetDirectories=[$ULTISNIPS_DIR, "UltiSnips"]

let g:ycm_confirm_extra_conf = 0
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

let g:flake8_quickfix_height=12

nnoremap <Leader>d :YcmCompleter GoToDefinitionElseDeclaration<cr>

nnoremap <Leader>v :e ~/.vimrc<cr>
nnoremap <Leader>z :e ~/.zshrc<cr>

" Q is my second leader because nuts to ex mode
nnoremap Qs :UltiSnipsEdit<cr>
nnoremap Qv :e ~/.vimrc<cr>
nnoremap QQ :bd!

if filereadable($HOME . "/.local.vim")
    source ~/.local.vim
endif

" fix paste issues in ipython
let g:slime_python_ipython = 1
let g:slime_target = "tmux"

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

au BufReadPost *.py nnoremap <buffer> <leader>ks :IPythonCellExecuteCell<cr>

au BufReadPost *.go nnoremap <buffer> <leader>ks :silent! exec "Dispatch echo > .restart"<cr>

function MaybeRespawnPane()
    silent let f = system("~/t.sh check")
    let l:x = v:shell_error
    if (l:x == 0)
        silent exec("!tmux last-pane ';' respawn-pane -k ';' last-pane")
    endif
endfunction

autocmd BufWritePre <buffer> call MaybeRespawnPane()

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:black_virtualenv = 1
