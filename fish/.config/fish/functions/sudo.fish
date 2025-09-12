function sudo
    if set -q DISPLAY
        command sudo -A $argv;
    else
        command sudo $argv;
    end
end
