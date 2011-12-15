" config which can be overridden (shared lines)
if !exists('g:snipMate')
  let g:snipMate = {}
endif
let s:snipMate = g:snipMate

" Drupal filename function. Use instead of Filename().
fun! DrupalFilename(...)
  " We need to chop off two path components. This has no adverse
  " effect on files with only one path component.
	let filename = expand('%:t:r:r')
	if filename == '' | return a:0 == 2 ? a:2 : '' | endif
	return !a:0 || a:1 == '' ? filename : substitute(a:1, '$1', filename, 'g')
endf

let s:snipMate['scope_aliases'] = get(s:snipMate,'scope_aliases',{'php' :'drupal,php,html,javascript' })

if has("autocmd")
  " Drupal php files.
  augroup module
    autocmd BufRead,BufNewFile *.{module,install,test,inc,profile} set filetype=php
    autocmd BufRead,BufNewFile *.{info,make} set filetype=dosini
  augroup END
endif
" vim:noet:sw=4:ts=4:ft=vim
