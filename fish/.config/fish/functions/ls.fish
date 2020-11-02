# Defined in - @ line 1
function ls --wraps='exa -la' --description 'alias ls=exa -la'
  exa -l --group-directories-first $argv;
end
