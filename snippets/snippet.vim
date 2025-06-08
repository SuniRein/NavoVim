function! snippet#CamelCaseFilename()
    let basename = expand('%:t:r')
    return substitute(basename, '\v(\w)(\w*)', '\u\1\L\2', 'g')
endfunction
