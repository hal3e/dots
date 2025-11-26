function jj-stack-size --description 'print the size of each PR/change in the stack'
    for rev in (jj log --no-graph -r 'main..@' -T 'change_id.short() ++ "\n"' | tac)
        echo "== "(jj log --no-graph -r $rev -T 'description.first_line()')" =="
        jj diff -r $rev --stat | tail -1
    end
end
