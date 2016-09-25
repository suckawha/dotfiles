" GENERAL

" Navigatable file tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Project searching
Plug 'rking/ag.vim'

" Sets the project root to the current Git repository by default
Plug 'airblade/vim-rooter'

" Shows the current git diff in the gutter.
Plug 'airblade/vim-gitgutter'

" Linting
Plug 'benekastah/neomake'

" Quickly rename files.
Plug 'tpope/vim-eunuch'

" Automatically resize open splits so the current is the biggest
Plug 'roman/golden-ratio'

" Better buffer deletion handling.
Plug 'moll/vim-bbye'



" TEXT EDITING

" Auto-completes quotes, brackets, etc.
Plug 'Raimondi/delimitMate'

" Automatically adds `end` in Ruby and has equivilents for other languages
Plug 'tpope/vim-endwise'

" Automatically close HTML tags
Plug 'alvan/vim-closetag'

" Quickly jump to words and characters in a file
Plug 'easymotion/vim-easymotion'

" Provides new motions to target when running operators
Plug 'wellle/targets.vim'

" Better auto-completion
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }



" SYNTAX PLUGINS

" Better Markdown editing
Plug 'reedes/vim-pencil'

" Language syntax highlighting
Plug 'digitaltoad/vim-pug'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Highlight CSS colors
Plug 'ap/vim-css-color'



" THEMES

" Better Vim status bar
Plug 'vim-airline/vim-airline'

" Color schemes
Plug 'zeis/vim-kolor'
Plug 'atelierbram/vim-colors_atelier-schemes'



" OVERRIDES

" Prevent Syntastic from running (in favor of Neomake)
Plug 'scrooloose/syntastic', { 'on': [] }