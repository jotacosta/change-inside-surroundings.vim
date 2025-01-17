" change-inside-surroundings.vim - Single command to change the contents of
" the innermost surroundings
" Maintainer:   Brian Doll <http://emphaticsolutions.com/>
" Version:      0.2

function! s:ChangeSurrounding(action, movement)
  " define 'surrounding' opening characters that we want to be able to change
  let surrounding_beginnings = ['{', '(', '"', '>', '[', "'", '`']
  let cursor_position = col('.')
  let line = getline('.')
  " nasty hack to omit single appostrophy matching
  if (count(split(line, '\zs'), "'") < 2)
    let l = remove(surrounding_beginnings, index(surrounding_beginnings, "'"))
  endif
  " walk the line backwards looking for the innermost 'surrounding' opening character
  while cursor_position > 0
    let char = line[cursor_position-1]
    let matched_beginning_index = index(surrounding_beginnings, char)
    if matched_beginning_index > -1
      if '>' == char
        " vim already understands HTML and XML tags so use that
        execute "normal! " . a:action . a:movement . "t"
      else
        execute "normal! " . a:action . a:movement . char
        if a:action == 'c'
            execute "normal! l"
            startinsert
        endif
      endif
      return
  endif
  let cursor_position -= 1
  endwhile
endfunction

command! ChangeInsideSurrounding :call <sid>ChangeSurrounding("c","i")
command! ChangeAroundSurrounding :call <sid>ChangeSurrounding("c","a")
command! SelectInsideSurrounding :call <sid>ChangeSurrounding("v","i")
command! SelectAroundSurrounding :call <sid>ChangeSurrounding("v","a")
command! DeleteInsideSurrounding :call <sid>ChangeSurrounding("d","i")
command! DeleteAroundSurrounding :call <sid>ChangeSurrounding("d","a")

" if !hasmapto(':ChangeInsideSura:rounding<CR>')
"   nmap <script> <silent> <unique> <Leader>ci :ChangeInsideSurrounding<CR>
" endif

" if !hasmapto(':ChangeAroundSurrounding<CR>')
"   nmap <script> <silent> <unique> <Leader>cas :ChangeAroundSurrounding<CR>
" endif
