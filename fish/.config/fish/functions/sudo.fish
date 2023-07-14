# Defined via `source`
function sudo --description 'alias sudo=sudo -A if $DISPLAY is set'
    if set -q DISPLAY
        command sudo -A $argv;
    else
        command sudo $argv;
    end
end
