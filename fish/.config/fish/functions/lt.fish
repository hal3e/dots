# Defined in - @ line 1
function lt --wraps='exa -laH --tree' --wraps='exa -la --tree' --description 'alias lt=exa -la --tree'
  exa -la --tree --group-directories-first $argv;
end
