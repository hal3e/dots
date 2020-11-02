# Defined in - @ line 1
function smi --wraps='sudo make install clean' --description 'alias smi=sudo make install clean'
  sudo make install clean $argv;
end
