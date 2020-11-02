# Defined in - @ line 1
function tdo --wraps='cat ~/todo/os.txt' --description 'alias tdo=cat ~/todo/os.txt'
  cat ~/todo/os.txt $argv;
end
