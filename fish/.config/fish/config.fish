function accept-suggest-and-exec
   commandline -f accept-autosuggestion
   commandline -f execute
end

function last_history_item
  echo $history[1]
end

function last_history_argument
    echo $history[1] | read --array --tokenize result
    echo "$result[-1]"
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

abbr -a -- sf 'source ~/.config/fish/config.fish'

abbr -a -- mw 'TERM=xterm ~/mnr/monero/monero-wallet-cli'
abbr -a -- md '~/mnr/monero/monerod --data-dir ~/mnt/monero/'

abbr -a -- se 'sudoedit -A'

abbr -a -- gs 'git status'
abbr -a -- ga 'git add .'
abbr -a -- gc 'git checkout'
abbr -a -- gd 'git diff'
abbr -a -- gds 'git diff --staged'
abbr -a -- gp 'git push'
abbr -a -- gD 'git reset HEAD --hard'
abbr -a -- gU 'git reset --soft HEAD~1'
abbr -a -- gpf 'git push --force'
abbr -a -- gca 'git commit --amend'
abbr -a -- gpa 'git pull --all'
abbr -a -- gmm 'git merge master'
abbr -a -- gcb 'git checkout -b'
abbr -a -- gcm 'git checkout master'
abbr -a -- grm 'git rebase master'
abbr -a -- gR 'git fetch --prune && git remote prune origin'
abbr -a --set-cursor -- gm 'git commit -m "%"'

abbr -a -- cc 'cargo clean'
abbr -a -- cu 'cargo update'
abbr -a -- ccw 'cargo check --workspace'
abbr -a -- cca 'cargo check --all-targets --workspace --tests'
abbr -a -- ccaf 'cargo check --all-targets --all-features --workspace --tests'
abbr -a -- ct 'cargo nextest run'
abbr -a -- cta 'cargo nextest run --all-targets --workspace'
abbr -a -- ctaf 'cargo nextest run --all-targets --all-features --workspace'
abbr -a -- cpa 'cargo +nightly clippy --all-targets'
abbr -a -- cpaf 'cargo +nightly clippy --all-targets --all-features'
abbr -a -- cfn '~/bin/cargo-format-nightly.sh'

abbr -a -- fb 'forc build --path e2e --release'
abbr -a -- fc 'forc clean --path e2e'
abbr -a -- ff 'forc fmt --path e2e'

abbr -a !! --position anywhere --function last_history_item
abbr -a !\* --position anywhere --function all_history_arguments
abbr -a !\$ --position anywhere --function last_history_argument
abbr -a !^ --position anywhere --function first_history_argument

abbr -a -- clip 'xclip -i -selection clipboard'
abbr -a --set-cursor -- cclip 'cat % | xclip -i -selection clipboard'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/hal3e/bin/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
