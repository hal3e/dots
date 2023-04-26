function ubuntu --wraps='~/bin/run-ubuntu.sh && exit' --description 'alias ubuntu=~/bin/run-ubuntu.sh && exit'
  ~/bin/run-ubuntu.sh && exit $argv; 
end
