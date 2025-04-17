function! snippet#Format(...)
    let template = get(a:000, 0, "$F")
    let fallback = get(a:000, 1, "")

    let basename = expand('%:t:r')
    let capitalize_basename = toupper(basename[0]) . basename[1:]

    if basename == ''
        return fallback
    else
        let str = template
        let str = substitute(str, '$F', basename, 'g')
        let str = substitute(str, '%F', capitalize_basename, 'g')
        return str
    endif
endfunction
