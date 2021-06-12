# Defined via `source`
function remove --wraps='sudo xbps-remove' --description 'alias remove=sudo xbps-remove'
  sudo xbps-remove $argv; 
end
