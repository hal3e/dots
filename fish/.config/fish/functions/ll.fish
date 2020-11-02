# Defined in - @ line 1
function ll --wraps='exa -laH' --description 'alias ll=exa -laH'
  exa -laH --group-directories-first $argv;
end
