# Defined in - @ line 1
function sxi --wraps='sudo xbps-install -S' --description 'alias sxi=sudo xbps-install -S'
  sudo -A xbps-install -S $argv;
end
