function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end


function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end


function accept-suggest-and-exec
   commandline -f accept-autosuggestion 
   commandline -f execute 
end


function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
    bind a\cM accept-suggest-and-exec 
    bind t\cM accept-autosuggestion
end
