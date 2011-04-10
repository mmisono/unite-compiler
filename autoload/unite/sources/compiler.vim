
let s:save_cpo = &cpo
set cpo&vim


let s:source = {
\   'name': 'compiler',
\}

function! s:source.gather_candidates(args, context)
    let files = map(split(globpath(&rtp,'compiler/*.vim'),'\n'),
                  \"matchstr(v:val,'\\w\\+\\(\\.vim\\)\\@=')")

    return map(files,"{
            \ 'word': v:val,
            \ 'source': 'compiler',
            \ 'kind': 'command',
            \ 'action__command': 'compiler '.v:val,
            \ }")
endfunction

function! unite#sources#compiler#define()
    return s:source
endfunction

let &cpo = s:save_cpo
