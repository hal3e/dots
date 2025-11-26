set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

set -gx ANDROID_USER_HOME "$XDG_DATA_HOME/android"
set -gx BROWSER firefox
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -gx EDITOR nvim
set -gx HISTFILE "$XDG_STATE_HOME/bash/history"
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx MANPAGER 'nvim +Man!'
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -gx PAGER less -FRX
set -gx PYLINTHOME "$XDG_CACHE_HOME/pylint"
set -gx TERMINAL st
set -gx XINITRC "$XDG_CONFIG_HOME/X11/xinitrc"

set -gx SKIM_OPTIONS_FILE "$XDG_CONFIG_HOME/skim/config"

# done
set -g __done_notification_duration 10000

# sponge
set -g sponge_delay 10
set -g sponge_regex_patterns '^(cd|ls).*'
set -g sponge_successful_exit_codes 0 130
set -g sponge_allow_previously_successful true

# fish colors
set -g fish_color_autosuggestion afafaf
set -g fish_color_cancel normal
set -g fish_color_command 79B3EC
set -g fish_color_comment grey
set -g fish_color_cwd 008000
set -g fish_color_cwd_root 800000
set -g fish_color_end A2D775
set -g fish_color_error E96370
set -g fish_color_escape cyan
set -g fish_color_history_current normal
set -g fish_color_host normal
set -g fish_color_host_remote yellow
set -g fish_color_keyword ''
set -g fish_color_match normal
set -g fish_color_normal normal
set -g fish_color_operator cyan
set -g fish_color_option ''
set -g fish_color_param white
set -g fish_color_quote A2D775
set -g fish_color_redirection magenta
set -g fish_color_search_match yellow
set -g fish_color_selection grey
set -g fish_color_status E96370
set -g fish_color_user A2D775
set -g fish_color_valid_path normal
set -g fish_greeting ''
