function bon --wraps='bluetoothctl power on' --wraps='bluetoothctl power on && sleep 1 && setxkbmap -v workman && xset r 66' --wraps='bluetoothctl power on && sleep 2 && setxkbmap -v workman && xset r 66' --wraps='bluetoothctl power on && sleep 3 && setxkbmap -v workman && xset r 66' --description 'alias bon=bluetoothctl power on && sleep 3 && setxkbmap -v workman && xset r 66'
  bluetoothctl power on && sleep 3 && setxkbmap -v workman && xset r 66 $argv; 
end
