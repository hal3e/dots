# Defined via `source`
function tse --wraps='nvim ~/time/*' --wraps='nvim (fd -e time . ~)' --description 'alias tse=nvim (fd -e time . ~)'
  nvim (fd -e time . ~/wrk/pro/) $argv; 
end
