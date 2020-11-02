# Defined in - @ line 1
function mids --wraps='cd dwm-distrotube/ && smi && cd ../st-distrotube/ &&  smi && cd ..' --wraps='cd ~/src/dwm-distrotube/ && smi && cd ../st-distrotube/ &&  smi && cd ..' --description 'alias mids=cd ~/src/dwm-distrotube/ && smi && cd ../st-distrotube/ &&  smi && cd ..'
  cd ~/src/dwm-distrotube/ && smi && cd ../st-distrotube/ &&  smi && cd .. $argv;
end
