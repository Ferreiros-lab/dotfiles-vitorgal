call pathogen#infect() " starts pathogen

set nocompatible " stops from behaving in a vi compatible way
syntax enable " color code syntax
"colorscheme solarized " colorscheme
"set background=dark " background
set number " line numbers
set guioptions-=T " remove toolbar on GUI
set guioptions-=r " remove right-hand scroll bar on GUI
highlight NonText guifg=bg " remove the ~ on empty lines
set autoindent " auto indent code
set tabstop=4 " how many columns (spaces) a tab counts for
set shiftwidth=4 " how many columns (spaces) text is reindented
set incsearch " highlights search matches as they are typed

"""""
" set autocompletions
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""
" map the Tab key in a clever way for code completion
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>
