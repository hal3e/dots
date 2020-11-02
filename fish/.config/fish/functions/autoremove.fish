# Defined in - @ line 1
function autoremove --wraps='sudo xbps-remove -Oo' --description 'alias autoremove=sudo xbps-remove -Oo'
  sudo xbps-remove -Oo $argv;
end
