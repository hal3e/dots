# Defined in - @ line 1
function xq --wraps='xbps-query -Rs' --description 'alias xq=xbps-query -Rs'
  xbps-query -Rs $argv;
end
