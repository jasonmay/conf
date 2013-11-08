let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

filetype off
call pathogen#incubate()
call pathogen#helptags()
filetype plugin indent on

colorscheme sumi
set bg=dark
set background=dark
set wildignore+=*.o,*.obj,.git,*.class,*.jar,*.zip

hi link coffeeSpaceError NONE
