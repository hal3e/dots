# Defined in - @ line 1
function tdi --wraps='cat ~/todo/ihlas.txt' --description 'alias tdi=cat ~/todo/ihlas.txt'
  cat ~/todo/ihlas.txt $argv;
end
