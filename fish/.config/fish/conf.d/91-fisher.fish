set -g fisher_path "$XDG_DATA_HOME/fisher"

# User-owned functions retain priority over plugin functions.
if not contains -- "$fisher_path/functions" $fish_function_path
  set -g fish_function_path \
      $fish_function_path[1] \
      "$fisher_path/functions" \
      $fish_function_path[2..-1]
end

if not contains -- "$fisher_path/completions" $fish_complete_path
  set -g fish_complete_path \
      $fish_complete_path[1] \
      "$fisher_path/completions" \
      $fish_complete_path[2..-1]
end

for file in $fisher_path/conf.d/*.fish
  source "$file"
end


# Temporarily load fisher, then fisher update installs fisher and
# every plugin from tracked fish_plugins into custom $fisher_path.

# set bootstrap (mktemp)
#
# if curl -fsSL \
#   https://raw.githubusercontent.com/jorgebucaran/fisher/4.4.8/functions/fisher.fish \
#   -o "$bootstrap"
#   source "$bootstrap"
#   and fisher update
# end
#
# rm -f "$bootstrap"
# set -e bootstrap

