# Defined in - @ line 1
function xqr --wraps='xbps-query -Rs icon | rg' --description 'alias xqr=xbps-query -Rs icon | rg'
  xbps-query -Rs icon | rg $argv;
end
