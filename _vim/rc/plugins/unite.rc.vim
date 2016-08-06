" 入力モードで開始する
let g:unite_enable_start_insert=1


" unite.vim上でのキーマッピング
autocmd MyAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 横分割で開く
  nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  imap <silent> <buffer> <expr> <C-j> unite#do_action('split')

  " 縦分割で開く
  nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction
