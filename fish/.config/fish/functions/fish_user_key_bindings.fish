function fish_user_key_bindings
  bind \ca accept-suggest-and-exec
  bind \cl accept-autosuggestion

  bind -M insert \ca accept-suggest-and-exec
  bind -M insert \cs accept-autosuggestion

  # Add a way to switch from insert to normal (command) mode.
  bind -s --preset -M insert nn "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"
end
