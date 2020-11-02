# Defined in - @ line 1
function tdw --wraps='cat ~/todo/work.txt' --description 'alias tdw=cat ~/todo/work.txt'
  cat ~/todo/work.txt $argv;
end
