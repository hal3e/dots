function jjrr --description 'Create review change on top of `into` from `from`'
    if test (count $argv) -ne 2
        echo "usage: jjrr REVSET_INTO REVSET_FROM " >&2
        return 2
    end

    set -l into $argv[1]
    set -l from $argv[2]

    command jj new $into; or return $status
    command jj restore --from $from --into @; or return $status
    command jj describe -m "review: $from - DELETE"
end
