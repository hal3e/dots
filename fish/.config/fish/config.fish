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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/hal3e/bin/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
