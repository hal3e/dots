function fish_user_key_bindings
  bind \ca accept-suggest-and-exec
  bind \cr accept-autosuggestion

  bind -M insert \ca accept-suggest-and-exec
  bind -M insert \cr accept-autosuggestion

  fish_vi_workman_key_bindings
end
