syntax on
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cindent
set nu
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set colorcolumn=100
set noshowmode
set cmdheight=2
set updatetime=50
set shortmess+=c
set splitbelow
set splitright

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'mattn/emmet-vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'jparise/vim-graphql'
Plug 'ryanoasis/vim-devicons'

call plug#end()


""""""""""" THEME """"""""""
"Gruvbox Material
let g:gruvbox_material_visual = 'blue background'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_menu_selection_background = 'blue'
"Gruvbox
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox-material
set background=dark


if executable('rg')
    let g:rg_derive_root='true'
endif
let loaded_matchparen = 1
let mapleader = " "


""""""""""" MAPPING """"""""""
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nmap 7 :vertical res-10<CR>
nmap 8 :vertical res+10<CR>
nmap 9 :res-10<CR>
nmap 0 :res+10<CR>
noremap K 5k
noremap J 5j
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
vnoremap X "_d
nnoremap go o<Esc>k
nnoremap gO O<Esc>j
nnoremap <leader>gc :GCheckout<CR>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nmap <leader>g; :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
nmap <D-j> <C-d>
imap jk <Esc>
imap kj <Esc>
imap jj <Esc>
nnoremap <leader>q :q<cr>
nnoremap <leader>z :wq<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap Y y$


" CoC
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<CR>
nnoremap <leader>gb  :<C-u>CocList buffers<CR>
nnoremap <leader>a <Plug>(coc-codeaction)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <leader>gh <Plug>(coc-fix-current)
map <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()
nmap <F3> :ToggleGStatus<CR>
map <C-n> :NERDTreeFind<CR>

"GitGutter
nmap  ghp <Plug>(GitGutterPreviewHunk)
nmap  ghu <Plug>(GitGutterUndoHunk)
nmap  ghs <Plug>(GitGutterStageHunk)
xmap  ghs <Plug>(GitGutterStageHunk)

""""" Easy motion
hi link EasyMotionTarget yellow
hi link EasyMotionIncSearch red
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap f <Plug>(easymotion-bd-fl)
nmap t <Plug>(easymotion-bd-tl)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>J <Plug>(easymotion-eol-j)
map <Leader>K <Plug>(easymotion-eol-k)
let g:easymotion#is_active = 0

let g:airline_section_y=''
let g:airline_section_z=''


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

fun! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfun
command! ToggleGStatus :call ToggleGStatus()

function! EasyMotionCoc() abort
    if EasyMotion#is_active()
        let g:easymotion#is_active = 1
        silent! CocDisable
    else
        if g:easymotion#is_active == 1
            let g:easymotion#is_active = 0
            silent! CocEnable
        endif
    endif
endfunction
autocmd TextChanged,CursorMoved * call EasyMotionCoc()

augroup focus
    autocmd!
    autocmd FocusLost,BufLeave * silent! wa
augroup END

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
