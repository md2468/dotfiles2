"Tabs
set softtabstop=4
set shiftwidth=4
set noexpandtab

"Indentation
set cindent

"Line numbers
set number
set relativenumber

"Line highlight
set cursorline

"Remove bar above console
set laststatus=0

"Use 24-bit colour
set termguicolors

"Scrolling margin
set scrolloff=4

"Disable line wrapping
set nowrap

"Tabline always visible
set showtabline=2

"Disable highlighting after replace and search                                                                                                                                            
set nohlsearch

"Tab switching shortcuts
nnoremap H gT
nnoremap L gt

"Tabline labels (from :help setting-tabline)
:set tabline=%!MyTabLine()
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr() " select the highlighting
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i + 1) . 'T' " set the tab page number (for mouse clicks)
    let s .= '%{MyTabLabel(' . (i + 1) . ')} ' " the label is made by MyTabLabel()
  endfor
  let s .= '%#TabLineFill#%T' " after the last tab fill with TabLineFill and reset tab page nr
  return s
endfunction
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return a:n . '|' . fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction


"Colour scheme
autocmd ColorScheme * hi Normal guibg=#000000
colorscheme gruvbox
