function accept-suggest-and-exec
   commandline -f accept-autosuggestion
   commandline -f execute
end

function last_history_item
  echo $history[1]
end

function last_history_argument
  set -q history[1]; or return
  printf '%s\n' "$history[1]" | read --array --tokenize result
  string escape -- "$result[-1]"
end

function first_history_argument
    echo $history[1] | read --array --tokenize result
    echo "$result[2]"
end

function all_history_arguments
    echo $history[1] | read --array --tokenize result
    echo "$result[2..]"
end

abbr -a -- n 'nvim'
abbr -a -- nws 'newsboat'

abbr -a -- ef 'exec fish'

abbr -a -- mw 'TERM=xterm ~/mnr/monero/monero-wallet-cli'
abbr -a -- md '~/mnr/monero/monerod --data-dir ~/mnt/extern/monero'

abbr -a -- se 'sudoedit -A'


abbr -a -- j 'jj'
abbr -a -- ja 'jj abandon'
abbr -a -- jd 'jj diff'
abbr -a -- jds 'jj diff --stat'
abbr -a -- je 'jj edit'
abbr -a -- jf 'jj git fetch'
abbr -a -- jn 'jj new'
abbr -a -- jna 'jj new -A'
abbr -a -- jp 'jj git push'
abbr -a -- jpa 'jj git push --all'
abbr -a -- jr 'jj rebase'
abbr -a -- js 'jj squash'
abbr -a -- jsh 'jj show'
abbr -a -- jst 'jj status'
abbr -a -- jb 'jj bookmark'
abbr -a --set-cursor -- jm 'jj commit -m "%"'
abbr -a --set-cursor -- jM 'jj describe -m "%"'

abbr -a -- g 'git'
abbr -a -- gs 'git status'
abbr -a --set-cursor -- gm 'git commit -m "%"'

abbr -a -- c 'cargo'
abbr -a -- cr 'cargo run'
abbr -a -- cb 'cargo build'
abbr -a -- crr 'cargo run --release'
abbr -a -- cbr 'cargo build --release'
abbr -a -- cc 'cargo clean'
abbr -a -- cC 'cargo check'
abbr -a -- cu 'cargo update'
abbr -a -- ccw 'cargo check --workspace'
abbr -a -- ct 'cargo nextest run'
abbr -a -- cpa 'cargo +nightly clippy --all-targets'
abbr -a -- cfn '~/bin/cargo-format-nightly.sh'

abbr -a !! --position anywhere --function last_history_item
abbr -a !\* --position anywhere --function all_history_arguments
abbr -a !\$ --position anywhere --function last_history_argument
abbr -a !^ --position anywhere --function first_history_argument

abbr -a -- clip 'xclip -i -selection clipboard'
abbr -a --set-cursor -- cclip 'cat % | xclip -i -selection clipboard'

set -g fish_key_bindings fish_vi_key_bindings

# bun
set --export BUN_INSTALL "$HOME/.local/share/bun"
set --export PATH $BUN_INSTALL/bin $PATH
