# Defined in - @ line 1
function tse --wraps='nvim ~/time/*' --description 'alias tse=nvim ~/time/*'
  nvim ~/time/* $argv;
end
