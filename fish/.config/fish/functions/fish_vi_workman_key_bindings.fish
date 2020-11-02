function fish_vi_workman_key_bindings --description 'vi-like key bindings for fish'
    if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    end

    # Erase all bindings if not explicitly requested otherwise to
    # allow for hybrid bindings.
    # This needs to be checked here because if we are called again
    # via the variable handler the argument will be gone.
    set -l rebind true
    if test "$argv[1]" = "--no-erase"
        set rebind false
        set -e argv[1]
    else
        bind --erase --all --preset # clear earlier bindings, if any
    end

    # Allow just calling this function to correctly set the bindings.
    # Because it's a rather discoverable name, users will execute it
    # and without this would then have subtly broken bindings.
    #if test "$fish_key_bindings" != "fish_vi_key_bindings"
    #    and test "$rebind" = "true"
    #    # Allow the user to set the variable universally.
    #    set -q fish_key_bindings
    #    or set -g fish_key_bindings
    #    # This triggers the handler, which calls us again and ensures the user_key_bindings
    #    # are executed.
    #    set fish_key_bindings fish_vi_key_bindings
    #    return
    #end

    set -l init_mode insert
    # These are only the special vi-style keys
    # not end/home, we share those.
    set -l eol_keys \$ g\$
    set -l bol_keys \^ 0 g\^

    if contains -- $argv[1] insert default visual
        set init_mode $argv[1]
    else if set -q argv[1]
        # We should still go on so the bindings still get set.
        echo "Unknown argument $argv" >&2
    end

    # Inherit shared key bindings.
    # Do this first so vi-bindings win over default.
    for mode in insert default visual
        __fish_shared_key_bindings -s -M $mode
    end

    bind -s --preset -M insert \r execute
    bind -s --preset -M insert \n execute

    bind -s --preset -M insert "" self-insert
    # Space expands abbrs _and_ inserts itself.
    bind -s --preset -M insert " " self-insert expand-abbr

    # Add a way to switch from insert to normal (command) mode.
    # Note if we are paging, we want to stay in insert mode
    # See #2871
    bind -s --preset -M insert nn "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"

    # Default (command) mode
    bind -s --preset :q exit
    bind -s --preset -m insert \cc __fish_cancel_commandline
    bind -s --preset -M default y backward-char
    bind -s --preset -M default o forward-char
    bind -s --preset -m insert \n execute
    bind -s --preset -m insert \r execute
    bind -s --preset -m insert u repaint-mode
    bind -s --preset -m insert U beginning-of-line repaint-mode
    bind -s --preset -m insert a forward-char repaint-mode
    bind -s --preset -m insert A end-of-line repaint-mode
    bind -s --preset -m visual c begin-selection repaint-mode

    #bind -s --preset -m insert o "commandline -a \n" down-line repaint-mode
    #bind -s --preset -m insert O beginning-of-line "commandline -i \n" up-line repaint-mode # doesn't work

    bind -s --preset gg beginning-of-buffer
    bind -s --preset G end-of-buffer

    for key in $eol_keys
        bind -s --preset $key end-of-line
    end
    for key in $bol_keys
        bind -s --preset $key beginning-of-line
    end

    bind -s --preset f history-search-backward
    bind -s --preset \cw history-search-forward

    bind -s --preset [ history-token-search-backward
    bind -s --preset ] history-token-search-forward

    bind -s --preset e up-or-search
    bind -s --preset n down-or-search
    bind -s --preset v backward-word
    bind -s --preset V backward-bigword
    bind -s --preset gr backward-word
    bind -s --preset gR backward-bigword
    bind -s --preset d forward-word forward-char
    bind -s --preset D forward-bigword forward-char
    bind -s --preset r forward-char forward-word backward-char
    bind -s --preset R forward-bigword backward-char

    # OS X SnowLeopard doesn't have these keys. Don't show an annoying error message.
    # Vi/Vim doesn't support these keys in insert mode but that seems silly so we do so anyway.
    bind -s --preset -M insert -k home beginning-of-line 2>/dev/null
    bind -s --preset -M default -k home beginning-of-line 2>/dev/null
    bind -s --preset -M insert -k end end-of-line 2>/dev/null
    bind -s --preset -M default -k end end-of-line 2>/dev/null

    # Vi moves the cursor back if, after deleting, it is at EOL.
    # To emulate that, move forward, then backward, which will be a NOP
    # if there is something to move forward to.
    bind -s --preset -M default x delete-char forward-char backward-char
    bind -s --preset -M default X backward-delete-char
    bind -s --preset -M insert -k hm delete-char forward-char backward-char
    bind -s --preset -M default -k hm delete-char forward-char backward-char

    # Backspace deletes a char in insert mode, but not in normal/default mode.
    bind -s --preset -M insert -k backspace backward-delete-char
    bind -s --preset -M default -k backspace backward-char
    bind -s --preset -M insert \cy backward-delete-char
    bind -s --preset -M default \cy backward-char
    bind -s --preset -M insert \x7f backward-delete-char
    bind -s --preset -M default \x7f backward-char
    bind -s --preset -M insert \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-ctrl-delete
    bind -s --preset -M default \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-ctrl-delete

    bind -s --preset hh kill-whole-line
    bind -s --preset H kill-line
    bind -s --preset h\$ kill-line
    bind -s --preset h\^ backward-kill-line
    bind -s --preset h0 backward-kill-line
    bind -s --preset hd kill-word
    bind -s --preset hd kill-bigword
    bind -s --preset hud forward-char forward-char backward-word kill-word
    bind -s --preset huD forward-char forward-char backward-bigword kill-bigword
    bind -s --preset had forward-char forward-char backward-word kill-word
    bind -s --preset haD forward-char forward-char backward-bigword kill-bigword
    bind -s --preset hr kill-word
    bind -s --preset hR kill-bigword
    bind -s --preset hv backward-kill-word
    bind -s --preset hV backward-kill-bigword
    bind -s --preset hgr backward-kill-word
    bind -s --preset hgR backward-kill-bigword
    bind -s --preset ht begin-selection forward-jump kill-selection end-selection
    bind -s --preset hb begin-selection forward-jump backward-char kill-selection end-selection
    bind -s --preset hT begin-selection backward-jump kill-selection end-selection
    bind -s --preset hB begin-selection backward-jump forward-char kill-selection end-selection

    bind -s --preset -m insert s delete-char repaint-mode
    bind -s --preset -m insert S kill-whole-line repaint-mode
    bind -s --preset -m insert mm kill-whole-line repaint-mode
    bind -s --preset -m insert M kill-line repaint-mode
    bind -s --preset -m insert m\$ kill-line repaint-mode
    bind -s --preset -m insert m\^ backward-kill-line repaint-mode
    bind -s --preset -m insert md kill-word repaint-mode
    bind -s --preset -m insert mD kill-bigword repaint-mode
    bind -s --preset -m insert mud forward-char forward-char backward-word kill-word repaint-mode
    bind -s --preset -m insert muD forward-char forward-char backward-bigword kill-bigword repaint-mode
    bind -s --preset -m insert mad forward-char forward-char backward-word kill-word repaint-mode
    bind -s --preset -m insert maD forward-char forward-char backward-bigword kill-bigword repaint-mode
    bind -s --preset -m insert mr kill-word repaint-mode
    bind -s --preset -m insert mR kill-bigword repaint-mode
    bind -s --preset -m insert mv backward-kill-word repaint-mode
    bind -s --preset -m insert mV backward-kill-bigword repaint-mode
    bind -s --preset -m insert mgr backward-kill-word repaint-mode
    bind -s --preset -m insert mgR backward-kill-bigword repaint-mode

    bind -s --preset '~' capitalize-word
    bind -s --preset gf downcase-word
    bind -s --preset gF upcase-word

    bind -s --preset N end-of-line delete-char
    bind -s --preset E 'man (commandline -t) 2>/dev/null; or echo -n \a'

    bind -s --preset jj kill-whole-line yank
    bind -s --preset J kill-whole-line yank
    bind -s --preset j\$ kill-line yank
    bind -s --preset j\^ backward-kill-line yank
    bind -s --preset jd kill-word yank
    bind -s --preset jD kill-bigword yank
    bind -s --preset jud forward-char forward-char backward-word kill-word yank
    bind -s --preset juD forward-char forward-char backward-bigword kill-bigword yank
    bind -s --preset jad forward-char forward-char backward-word kill-word yank
    bind -s --preset jaD forward-char forward-char backward-bigword kill-bigword yank
    bind -s --preset jr kill-word yank
    bind -s --preset jR kill-bigword yank
    bind -s --preset jv backward-kill-word yank
    bind -s --preset jV backward-kill-bigword yank
    bind -s --preset jgr backward-kill-word yank
    bind -s --preset jgR backward-kill-bigword yank

    bind -s --preset t forward-jump
    bind -s --preset T backward-jump
    bind -s --preset b forward-jump-till
    bind -s --preset B backward-jump-till
    bind -s --preset i repeat-jump
    bind -s --preset , repeat-jump-reverse

    # in emacs yank means paste
    bind -s --preset ';' yank
    bind -s --preset ':' backward-char yank
    bind -s --preset 'g;' yank-pop

    bind -s --preset '"*;' "commandline -i ( xsel -p; echo )[1]"
    bind -s --preset '"*;' backward-char "commandline -i ( xsel -p; echo )[1]"

    #
    # Lowercase r, enters replace_one mode
    #
    bind -s --preset -m replace_one w repaint-mode
    bind -s --preset -M replace_one -m default '' delete-char self-insert backward-char repaint-mode
    bind -s --preset -M replace_one -m default \r 'commandline -f delete-char; commandline -i \n; commandline -f backward-char; commandline -f repaint-mode'
    bind -s --preset -M replace_one -m default \e cancel repaint-mode

    #
    # Uppercase R, enters replace mode
    #
    bind -s --preset -m replace W repaint-mode
    bind -s --preset -M replace '' delete-char self-insert
    bind -s --preset -M replace -m insert \r execute repaint-mode
    bind -s --preset -M replace -m default \e cancel repaint-mode
    # in vim (and maybe in vi), <BS> deletes the changes
    # but this binding just move cursor backward, not delete the changes
    bind -s --preset -M replace -k backspace backward-char

    #
    # visual mode
    #
    bind -s --preset -M visual y backward-char
    bind -s --preset -M visual o forward-char

    bind -s --preset -M visual e up-line
    bind -s --preset -M visual n down-line

    bind -s --preset -M visual v backward-word
    bind -s --preset -M visual V backward-bigword
    bind -s --preset -M visual gr backward-word
    bind -s --preset -M visual gR backward-bigword
    bind -s --preset -M visual d forward-word
    bind -s --preset -M visual D forward-bigword
    bind -s --preset -M visual r forward-word
    bind -s --preset -M visual R forward-bigword
    bind -s --preset -M visual p swap-selection-start-stop repaint-mode

    bind -s --preset -M visual t forward-jump
    bind -s --preset -M visual b forward-jump-till
    bind -s --preset -M visual T backward-jump
    bind -s --preset -M visual B backward-jump-till

    for key in $eol_keys
        bind -s --preset -M visual $key end-of-line
    end
    for key in $bol_keys
        bind -s --preset -M visual $key beginning-of-line
    end

    bind -s --preset -M visual -m insert m kill-selection end-selection repaint-mode
    bind -s --preset -M visual -m default h kill-selection end-selection repaint-mode
    bind -s --preset -M visual -m default x kill-selection end-selection repaint-mode
    bind -s --preset -M visual -m default X kill-whole-line end-selection repaint-mode
    bind -s --preset -M visual -m default j kill-selection yank end-selection repaint-mode
    bind -s --preset -M visual -m default '"*j' "commandline -s | xsel -p; commandline -f end-selection repaint-mode"

    bind -s --preset -M visual -m default \cc end-selection repaint-mode
    bind -s --preset -M visual -m default \e end-selection repaint-mode

    # Make it easy to turn an unexecuted command into a comment in the shell history. Also, remove
    # the commenting chars so the command can be further edited then executed.
    bind -s --preset -M default \# __fish_toggle_comment_commandline
    bind -s --preset -M visual \# __fish_toggle_comment_commandline
    bind -s --preset -M replace \# __fish_toggle_comment_commandline

    # Set the cursor shape
    # After executing once, this will have defined functions listening for the variable.
    # Therefore it needs to be before setting fish_bind_mode.
    fish_vi_cursor

    set fish_bind_mode $init_mode
end
