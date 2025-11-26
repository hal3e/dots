function jjr --description 'Create review change at fork point with main and restore target into it'
    if test (count $argv) -ne 1
        echo "usage: jjr FROM" >&2
        return 2
    end

    set -l from $argv[1]

    command jj new "fork_point($from | main@origin)"; or return $status
    command jj restore --from "$from" --into @; or return $status
    command jj describe -m "review: $from - DELETE"
end
