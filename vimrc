""""""""""""""""""""""""""""""
" pathogen
""""""""""""""""""""""""""""""
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
"filetype plugin indent on


colorscheme desert

" 支援 256 色
set t_Co=256
" 設定語法高亮
syntax on
"設定高亮度搜索
set hlsearch
"將搜尋到的字由土黃色變成深藍色
highlight Search term=reverse ctermbg=4 ctermfg=7

"置底功能列
set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

""""""""""""""""""""""""""""""
" vim 排版
""""""""""""""""""""""""""""""
"自動縮排功能
set autoindent
"set smartindent
"set paste  "停用所有的格式設定

""摺疊程式碼
"set foldmethod=indent
"set foldlevel=4   "2層的折疊將被關閉
"set foldnestmax=99   "foldnestmax它會限制最多折疊幾層
""set foldcolumn=4   "預留一塊foldcolumn的空間顯示折疊情形
""摺疊程式碼(顏色)
""hi Folded        ctermfg=brown ctermbg=NONE

"設定自動摺行
set nowrap
nmap <silent> <F8> :set wrap!<CR>

""""""""""""""""""""""""""""""
" vim 功能鍵修改
""""""""""""""""""""""""""""""
" set leader to,
" 当mapleader为未设置或为空时，使用缺省的”\”来作为mapleader
let mapleader=","
let g:mapleader=","

"-----------------------------------------------
" putty keyboard input change for VIM
"   use 'od -v' to see real input in PuTTY
"echo hostname()
if hostname() != "ubuntu"
	map  <ESC>[A <C-Up>    
	map  <ESC>[B <C-Down>
	map! <ESC>[A <C-Up>
	map! <ESC>[B <C-Down>
else 
endif
"  map aplly in Visual mode, Normal mode
"  map! apply in Insert mode, Command-line mode 

"畫面滾動
nmap <C-up> <C-y>
nmap <C-down> <C-e>
"-----------------------------------------------

"設定行號
nmap <F7> :set nu!<CR>

"show QuickFix Switch Win for 'vimgrep' result
nmap <silent> <F10> :call QFSwitch()<CR>

"關閉高亮搜尋標記
nmap <leader>/ :nohl<CR>

" ,p toggles paste mode
" "set past?" display the status
" "<BAR>" means &&
nmap <leader>p :set paste!<BAR>set paste?<CR>

""""""""""""""""""""""""""""""
" QuickFix Switch Win function
""""""""""""""""""""""""""""""
function! QFSwitch()
	redir => ls_output
		execute ':silent! ls'
	redir END

	let exists = match(ls_output, "[Quickfix List")
	if exists == -1
		execute ':copen'
	else
		execute ':cclose'
	endif
endfunction


""""""""""""""""""""""""""""""
" EasyGrep (keymap vimgrep)
""""""""""""""""""""""""""""""
let g:EasyGrepRecursive=1  " specifies that recursive search be activated on start (0 / 1)

""""""""""""""""""""""""""""""
" NERD tree (file exporer) 
""""""""""""""""""""""""""""""
let g:NERDTreeQuitOnOpen = 1  " 打开文件后是否关闭NerdTree窗口
let g:NERDTreeWinPos= 1 " 1=窗口出現在右方
"let g:NERDTreeIgnore = [ '^\.svn$', '\~$' ] " 忽略.svn的显示

nmap <silent><F12>  :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" vim Bookmarks  
""""""""""""""""""""""""""""""
nmap <F5> :MarksBrowser<CR>

""""""""""""""""""""""""""""""
" TagBar (ctags)
""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = 'ctags'

let g:tagbar_left = 1       " 放在畫面左側
let g:tagbar_width = 30     " (default)40 -> 30
let g:tagbar_autoclose = 1  " 选择了tag后自动关闭tagbar窗口
let g:tagbar_autofocus = 1  " 打開tagbar時焦點移過去
let g:tagbar_sort = 0       " 依照程式碼中的位置來排序tag
"let g:tagbar_compact = 1    " 關閉置頂help提示


nmap <silent> <F9> :TagbarToggle<CR>

""""""""""""""""""""""""""""""
" Bug Fix about tags
""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = '/home/omk/local/bin/ctags'  "resolve 'Exuberant ctags not found' log

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
"set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags
 
"let Tlist_Show_One_File = 1         " 不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1       " 如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Close_On_Select = 1       " 选择了tag后自动关闭taglist窗口
"let Tlist_GainFocus_On_ToggleOpen = 1 " 打开taglist窗口时，焦点在taglist窗口中

"nmap <silent> <F9> :TlistToggle<CR>

""""""""""""""""""""""""""""""
" neocomplcache  
""""""""""""""""""""""""""""""

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""
" Cscope
""""""""""""""""""""""""""""""
" cs add ../../../../../
if has("cscope")
"	if filereadable("/home/omk/download/sh5cl/cscope.out")
"		cs add /home/omk/download/sh5cl/cscope.out
"	endif
"	if filereadable("/home/omk/download/laptop-net-2.26.orig/cscope.out")
"		cs add /home/omk/download/laptop-net-2.26.orig/cscope.out 
"	endif
"	if filereadable("/home/omk/task/rtorrent-0.8.6/cscope.out")
"		cs add /home/omk/task/rtorrent-0.8.6/cscope.out 
"	endif
"	if filereadable("/home/omk/download/src/rtorrent-0.8.9/cscope.out")
"		cs add /home/omk/download/src/rtorrent-0.8.9/cscope.out 
"	endif
"	if filereadable("/home/omk/download/src/libtorrent-0.12.6/cscope.out")
"		cs add /home/omk/download/src/libtorrent-0.12.6/cscope.out 
"	endif
"	if filereadable("/home/omk/download_large/linux-2.6.20/cscope.out")
"		cs add /home/omk/download_large/linux-2.6.20/cscope.out  
"	endif
"	if filereadable("/home/omk/download_large/linux-2.6.32.32/cscope.out")
"		cs add /home/omk/download_large/linux-2.6.32.32/cscope.out  
"	endif
"	if filereadable("/home/omk/download_large/linux-2.6.32.32_ugw5.1/cscope.out")
"		cs add /home/omk/download_large/linux-2.6.32.32_ugw5.1/cscope.out  
"	endif
"	if filereadable("/home/omk/download_large/linux-2.6.39.4/cscope.out")
"		cs add /home/omk/download_large/linux-2.6.39.4/cscope.out  
"	endif
"	if filereadable("/home/omk/task/igmp/cscope.out")
"		cs add /home/omk/task/igmp/cscope.out 
"	endif
endif


