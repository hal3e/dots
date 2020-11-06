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

set -x SKIM_DEFAULT_OPTIONS '--bind=ctrl-e:up --color=bg+:#3B4252,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'

set -x EDITOR nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/hal3e/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
