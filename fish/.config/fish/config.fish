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
    bind \ca accept-suggest-and-exec 
    bind \ce accept-autosuggestion
end

cd ~
set -x FZF_DEFAULT_OPTS '--bind=ctrl-e:up --color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'
set -x SKIM_DEFAULT_COMMAND "ls ~"
