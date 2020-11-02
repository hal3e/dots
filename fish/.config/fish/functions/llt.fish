# Defined in - @ line 1
function llt --wraps='exa -laH --tree' --description 'alias llt=exa -laH --tree'
  exa -laH --tree --group-directories-first $argv;
end
