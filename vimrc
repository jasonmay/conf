let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

filetype off
call pathogen#incubate()
call pathogen#helptags()
filetype plugin indent on

set encoding=utf8
syntax on
set ruler
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

set expandtab
set shiftround
set autoindent
set smartindent

set foldenable
set foldmethod=marker

set backupskip=/tmp/*,/private/tmp/*"

let perl_extended_vars=1
let perl_include_pod=1
let perl_string_as_statement=1
let perl_sync_dist=1000

let g:EclimCompletionMethod = 'omnifunc'

let &term="xterm-256color"
set bg=dark
colorscheme sumi

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

autocmd BufNewFile,BufRead initialdata set ft=perl

autocmd FileType ruby,eruby,html,haml,coffee set ts=2 sw=2 sts=2
autocmd FileType java set ts=3 sw=3 sts=3
autocmd FileType javascript,perl set ts=4 sw=4 sts=4

autocmd FileType           perl setlocal makeprg=$VIMRUNTIME/tools/efm_perl.pl\ -c\ %\ $*
autocmd FileType           perl setlocal errorformat=%f:%l:%m

" Automatic commands
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
hi EOLWS ctermbg=red


autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>

autocmd BufReadPost *
\  if line("'\"") > 0 && line("'\"") <= line("$") |
\    exe "normal g`\"" |
\  endif

if exists(":Rvm")
    autocmd BufEnter * Rvm
endif

" Mappings

inoremap <silent> <C-a> <ESC>u:set paste<CR>.:set nopaste<CR>gi

nmap     Y          y$

nmap     <Right>    :bn<CR>
nmap     <Left>     :bp<CR>

imap     <Right>    <C-o>:bn<CR>
imap     <Left>     <C-o>:bp<CR>

nmap     H          ^
vmap     H          ^
nmap     L          $
vmap     L          $

nmap     M          :nohl<CR>:syn on<CR>:syntax sync fromstart<CR>:set background=dark<CR><C-k>

nmap     <Left>     :bn<CR>
nmap     <Right>    :bp<CR>

nmap     <CR>       o<Esc>
nmap     <F1>       <Esc>
inoremap <F1>       <Esc>

inoremap <c-j> <c-r>=TriggerSnippet()<cr>

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

nnor <Leader>.s :!~/proj/rsync/sync.sh<cr>

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

if $SHELL =~ 'zsh' && exists('g:_zsh_hist_fname')
    let s:initial_files = {}

    autocmd VimEnter * call <SID>init_zsh_hist()
    autocmd BufNewFile,BufRead * call <SID>zsh_hist_append()
    autocmd BufDelete * call <SID>remove_initial_file(expand("<afile>"))

    function! s:remove_initial_file (file)
        if has_key(s:initial_files, a:file)
            unlet s:initial_files[a:file]
        endif
    endfunction
    function! s:get_buffer_list_text ()
        redir => output
        ls!
        redir END
        return output
    endfunction
    function! s:get_buffer_list ()
        silent let output = <SID>get_buffer_list_text()
        let buffer_list = []
        for buffer_desc in split(output, "\n")
            let buffer_bits = split(buffer_desc, '"')
            call add(buffer_list, buffer_bits[1])
        endfor
        return buffer_list
    endfunction
    function! s:init_zsh_hist ()
        for fname in <SID>get_buffer_list()
            let s:initial_files[fname] = 1
        endfor
        call delete(g:_zsh_hist_fname)
    endfunction
    function! s:zsh_hist_append ()
        let to_append = expand("%")
        " XXX fuzzyfinder sets buftype too late to be caught by this... this
        " is broken, but not sure what a better fix is
        if &buftype == '' && to_append != "[fuf]"
            if !has_key(s:initial_files, to_append)
                if filereadable(g:_zsh_hist_fname)
                    let hist = readfile(g:_zsh_hist_fname)
                else
                    let hist = []
                endif
                call add(hist, to_append)
                call writefile(hist, g:_zsh_hist_fname)
            endif
        endif
    endfunction
endif

function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

set wildignore+=*.o,*.obj,.git,*.class,*.jar,*.zip

hi link coffeeSpaceError NONE

highlight Normal ctermfg=grey ctermbg=black
