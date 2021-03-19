if !has('python3')
    " echo "Error: Required vim compiled with +python"
    finish
endif

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:config_filename = 'log_highlighter'

python3 << ENDPYTHON
import sys
from os.path import normpath, join
import vim
from importlib import reload

plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))

sys.path.insert(0, python_root_dir)

import logutils

ENDPYTHON

"if exists('g:logutils_plugin_loaded')
"    finish
"endif

noremap  <silent><leader>hs :call HighlightWithSettings() \| nohls<CR>
noremap  <silent><leader>ha :call HighlightAutomatically() \| nohls<CR>
noremap  <silent><leader>hh :call HighlightHybrid() \| nohls<CR>
noremap  <silent><leader>ho :call OpenConfig() \| nohls<CR>
noremap  <silent><leader>hc :call HighlightClear() \| nohls<CR>

let s:group = "LogsHighlighter_highlight" 

function! HighlightWithSettings()
    python3 logutils.highlight_with_settings()
endfunction

function! HighlightAutomatically()
    python3 logutils.highlight_automatically()
endfunction

function! HighlightHybrid()
    python3 logutils.highlight_hybrid()
endfunction

function! HighlightClear()
   python3 logutils.clear()    
endfunction

function! OpenConfig()
    exec ":vsplit $VIM/" . s:config_filename
endfunction

"let g:logutils_plugin_loaded = 1
