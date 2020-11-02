# Defined in - @ line 1
function tde --wraps='nvim ~/todo/*' --description 'alias tde=nvim ~/todo/*'
  nvim ~/todo/* $argv;
end
