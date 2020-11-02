# Defined in - @ line 1
function tdm --wraps='cat ~/todo/msc.txt' --description 'alias tdm=cat ~/todo/msc.txt'
  cat ~/todo/msc.txt $argv;
end
