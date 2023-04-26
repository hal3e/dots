function sx --wraps=startx --wraps='startx &> /dev/null' --description 'alias sx=startx &> /dev/null'
  startx &> /dev/null $argv; 
end
