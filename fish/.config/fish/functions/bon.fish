# Defined via `source`
function bon --wraps='bluetoothctl power on' --description 'alias bon=bluetoothctl power on'
  bluetoothctl power on $argv; 
end
