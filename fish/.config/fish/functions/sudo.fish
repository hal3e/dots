# Defined via `source`
function sudo --description 'alias sudo=sudo -A'
 command sudo -A $argv; 
end
