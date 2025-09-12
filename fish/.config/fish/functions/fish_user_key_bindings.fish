function fish_user_key_bindings
  bind \cA accept-suggest-and-exec
  bind \cS accept-autosuggestion
  bind \cK forward-word

  bind -M insert \cA accept-suggest-and-exec
  bind -M insert \cS accept-autosuggestion
  bind -M insert \cK forward-word

  bind \cN 'nextd; commandline -f repaint'
  bind \cP 'prevd; commandline -f repaint'

  bind -M insert \cN 'nextd; commandline -f repaint'
  bind -M insert \cP 'prevd; commandline -f repaint'

  # Add a way to switch from insert to normal (command) mode.
  bind -s --preset -M insert nn "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"

  bind -M insert \b backward-kill-path-component

  for mode in default insert visual
    bind -M $mode \r -m $mode execute
  end
end
