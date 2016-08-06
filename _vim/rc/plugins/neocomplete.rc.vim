" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
            \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" for vim-multiple-cursors
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnLock') == 2
        exe 'NeoCompleteUnLock'
    endif
endfunction
