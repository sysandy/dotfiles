" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
 if &compatible
   set nocompatible
 endif


" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start


set ai			" always set autoindenting on
"set backup		" keep a backup file

set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set background=dark	" settings for colors in a dark terminal background
"set showcmd		" display incomplete commands
"set wildmenu		" display completion matches in a status line

"set ttimeout		" time out for key codes
"set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
" set display=truncate

" Do incremental searching when it's possible to timeout.
" if has('reltime')
"  set incsearch
" endif


" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
" set nrformats-=octal

" Only do this part when compiled with support for autocommands
 if has("autocmd")
   augroup fedora
   autocmd!
  " In text files, always limit the width of text to 78 characters
   autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
   autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  " 1724126 - do not open new file with .spec suffix with spec file template
  " apparently there are other file types with .spec suffix, so disable the
  " template
  " autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
   augroup END
 endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
 " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
  set hlsearch
endif

" Added for clrzr
" sets foreground color (ANSI, true-color mode)
  let &t_8f = "\e[38;2;%lu;%lu;%lum"

  " sets background color (ANSI, true-color mode)
  let &t_8b = "\e[48;2;%lu;%lu;%lum"

  set termguicolors
