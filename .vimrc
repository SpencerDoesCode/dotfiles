set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.

syntax on  "Enables syntax highlighting for programming languages
execute pathogen#infect()
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set mouse=
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set number  "Enables line numbering
set smarttab 
set tabstop=4 
set shiftwidth=4 
set noexpandtab 
autocmd BufNewFile,BufRead *.py,*yml set expandtab
set ruler
set incsearch
set ignorecase
set smartcase
set hlsearch
set title 
set titleold="" 
set titlestring=%F 
set paste
set magic
set foldmethod=manual  "Lets you hide sections of code
set splitright
set background=dark
colors elflord " Colorscheme for over ssh connections
"--- The following commands make the navigation keys work like standard editors
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
"--- Ends navigation commands

"--- Leader assignment and commands
let mapleader = ","
nmap <Leader>v :tabnew $MYVIMRC<CR>
nmap <Leader>mv :source $MYVIMRC<CR>
nmap <Leader>n :nohl<CR>
vmap <Leader>c :w !pbcopy<CR><CR>
nmap <Leader>mk :mksession! ~/.vim/session/
nmap <Leader>g :Ag
"May need this....
nmap <Leader>s :tabo<CR>:Startify<CR>
"--- Quick hack to close quickfix window when it doesn't have focus
nmap <Leader>q <C-w>wq 

set t_Co=256

if has('gui_running')
  set guifont=CourierNew:h11
endif

"--- Ctrl-P config
cd ~/repos
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-x>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.svn$\|\.git$\|\.npmignore$\|\.gitignore$|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.ico*|\.DS_Store$|\.gitignore$|\.bower.*$|\.*rc$'
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.svn/*,\*.DS_Store

let g:robot_syntax_for_txt = 1

"--- Tab configuration
nmap tn :tabnew<CR>
nmap tl :tablast<CR>
nmap tf :tabfirst<CR>
nmap ) :tabnext<CR>
nmap ( :tabprev<CR>

autocmd VimEnter * wincmd p
au BufRead,BufNewFile *.js set filetype=jquery
au BufRead,BufNewFile *.scss set filetype=scss
nnoremap n nzzzv
nnoremap N Nzzzv
function! SearchWord(word)
    let @/ = '\<' . a:word . '\>'
	normal n
endfunction
command! -nargs=1 SearchWord call SearchWord(<f-args>)
nmap ? :SearchWord 
hi Search cterm=NONE ctermfg=white ctermbg=blue
hi Visual cterm=NONE ctermfg=white ctermbg=blue
vnoremap < <gv
vnoremap > >gv
nnoremap <NL> i<CR><ESC>

function NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

"Custom plugin stuff
let g:EasyMotion_leader_key = 'Q'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ }
set noshowmode
