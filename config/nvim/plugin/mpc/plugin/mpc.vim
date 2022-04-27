function! OpenMPC()
    let playlist = ['one', 'two', 'three']
    
    if(bufexists('mpc.mpdv'))
        let mpcwin = bufwinnr('mpc.mpdv')
        if(mpcwin == -1)
            execute "sbuffer " . bufnr('mpc.mpdv')
        else
            execute mpcwin . 'wincmd w'
            return
        endif
    else
        execute "new mpc.mpdv"
    endif
    call append(0, playlist)
endfunction
